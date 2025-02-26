defmodule CoinExchange.App.Router do
  use Commanded.Commands.Router

  alias CoinExchange.App.Aggregates.Customer
  alias CoinExchange.App.Commands.{CreateCustomer, SellCoins, BuyCoins}

  identify(Customer, by: :id)

  dispatch([CreateCustomer, SellCoins, BuyCoins], to: Customer)
end
