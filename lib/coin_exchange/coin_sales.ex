defmodule CoinExchange.App.CoinSale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coin_sales" do
    field :coins, :integer
    field :price, :integer
    field :customer_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(coin_sales, attrs) do
    coin_sales
    |> cast(attrs, [:coins, :price])
    |> validate_required([:coins, :price])
  end
end
