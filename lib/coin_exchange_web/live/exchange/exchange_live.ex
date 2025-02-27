defmodule CoinExchangeWeb.ExchangeLive do
  use CoinExchangeWeb, :live_view

  alias CoinExchange.App.Commands.{CreateCustomer, SellCoins, BuyCoins}
  alias CoinExchange.App.Router

  def mount(_params, _session, socket) do
    {:ok, assign(socket, customers: [], offers: [])}
  end

  def handle_event("create_customer", %{"nickname" => nickname}, socket) do
    id = UUID.uuid4()
    Router.dispatch(%CreateCustomer{id: id, nickname: nickname})

    {:noreply,
     assign(socket, customers: [%{id: id, nickname: nickname} | socket.assigns.customers])}
  end

  def handle_event(
        "sell_coins",
        %{"customer_id" => customer_id, "coins" => coins, "price" => price},
        socket
      ) do
    Router.dispatch(%SellCoins{
      id: customer_id,
      coins: String.to_integer(coins),
      price: String.to_integer(price)
    })

    {:noreply,
     assign(socket,
       offers: [%{customer_id: customer_id, coins: coins, price: price} | socket.assigns.offers]
     )}
  end

  def handle_event("buy_coins", %{"offer_id" => offer_id, "buyer_id" => buyer_id}, socket) do
    offer = Enum.find(socket.assigns.offers, fn o -> o.id == offer_id end)

    Router.dispatch(%BuyCoins{
      id: offer.customer_id,
      coins: offer.coins,
      price: offer.price,
      buyer_id: buyer_id
    })

    {:noreply, assign(socket, offers: List.delete(socket.assigns.offers, offer))}
  end
end
