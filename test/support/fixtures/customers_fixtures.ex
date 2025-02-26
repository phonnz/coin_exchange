defmodule CoinExchange.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CoinExchange.Customers` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        funds: 42,
        nickname: "some nickname"
      })
      |> CoinExchange.Customers.create_customer()

    customer
  end
end
