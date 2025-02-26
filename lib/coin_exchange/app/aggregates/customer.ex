defmodule CoinExchange.App.Aggregates.Customer do
  defstruct [:id, :nickname, :assets, :funds]

  alias CoinExchange.App.Commands.{CreateCustomer, SellCoins, BuyCoins}
  alias CoinExchange.App.Events.{CustomerCreated, CoinsSold, CoinsBought}

  def execute(%Customer{id: nil}, %CreateCustomer{id: id, nickname: nickname}) do
    %CustomerCreated{id: id, nickname: nickname, assets: [], funds: 0}
  end

  def execute(%Customer{} = customer, %SellCoins{id: id, coins: coins, price: price}) do
    %CoinsSold{id: id, coins: coins, price: price}
  end

  def execute(%Customer{} = customer, %BuyCoins{
        id: id,
        coins: coins,
        price: price,
        buyer_id: buyer_id
      }) do
    %CoinsBought{id: id, coins: coins, price: price, buyer_id: buyer_id}
  end

  def apply(%Customer{} = customer, %CustomerCreated{
        id: id,
        nickname: nickname,
        assets: assets,
        funds: funds
      }) do
    %Customer{customer | id: id, nickname: nickname, assets: assets, funds: funds}
  end

  def apply(%Customer{} = customer, %CoinsSold{coins: coins, price: price}) do
    %Customer{customer | assets: customer.assets -- [coins], funds: customer.funds + price}
  end

  def apply(%Customer{} = customer, %CoinsBought{coins: coins, price: price}) do
    %Customer{customer | assets: customer.assets ++ [coins], funds: customer.funds - price}
  end
end
