defmodule CoinExchange.App.Commands do
  defmodule CreateCustomer do
    defstruct [:id, :nickname]
  end

  defmodule SellCoins do
    defstruct [:id, :coins, :price]
  end

  defmodule BuyCoins do
    defstruct [:id, :coins, :price, :buyer_id]
  end
end
