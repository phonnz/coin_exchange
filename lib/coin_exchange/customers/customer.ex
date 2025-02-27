defmodule CoinExchange.Customers.Customer do
  # alias Postgrex.Extensions.Array
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :nickname, :string
    field :funds, :integer
    field :assets, {:array, :map}

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:nickname, :funds])
    |> validate_required([:nickname, :funds])
  end
end
