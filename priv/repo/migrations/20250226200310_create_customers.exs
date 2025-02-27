defmodule CoinExchange.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :nickname, :string
      add :funds, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
