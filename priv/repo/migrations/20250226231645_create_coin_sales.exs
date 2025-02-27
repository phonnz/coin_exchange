defmodule CoinExchange.Repo.Migrations.CreateCoinSales do
  use Ecto.Migration

  def change do
    create table(:coin_sales) do
      add :coins, :integer
      add :price, :integer
      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:coin_sales, [:customer_id])
  end
end
