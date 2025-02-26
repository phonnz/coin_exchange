defmodule CoinExchange.Repo do
  use Ecto.Repo,
    otp_app: :coin_exchange,
    adapter: Ecto.Adapters.Postgres
end
