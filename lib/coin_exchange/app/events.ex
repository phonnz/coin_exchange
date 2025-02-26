defmodule CoinExchange.App.Events do
  defmodule CustomerCreated do
    defstruct [:id, :nickname, :assets, :funds]
  end

  defmodule CoinsSold do
    defstruct [:id, :coins, :price]
  end

  defmodule CoinsBought do
    defstruct [:id, :coins, :price, :buyer_id]
  end
end
