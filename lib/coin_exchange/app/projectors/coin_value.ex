defmodule CoinExchange.App.Projectors.CoinValue do
  use Commanded.Projections.Ecto,
    application: CoinExchange.App.Application,
    name: "coin_value_projection",
    repo: CoinExchange.Repo

  alias CoinExchange.App.Events.{CoinsSold, CoinsBought}
  alias CoinExchange.App.{CoinSale, CoinPurchase}

  project(%CoinsSold{price: price}, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :coin_sale, %CoinSale{price: price})
  end)

  project(%CoinsBought{price: price}, _metadata, fn multi ->
    Ecto.Multi.insert(multi, :coin_purchase, %CoinPurchase{price: price})
  end)
end
