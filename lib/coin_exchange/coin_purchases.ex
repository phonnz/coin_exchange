defmodule CoinExchange.App.CoinPurchase do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coin_purchases" do
    field :coins, :integer
    field :price, :integer
    field :customer_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(coin_purchases, attrs) do
    coin_purchases
    |> cast(attrs, [:coins, :price])
    |> validate_required([:coins, :price])
  end
end
