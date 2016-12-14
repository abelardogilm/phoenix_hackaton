defmodule PhoenixHackaton.FlightView do
  use PhoenixHackaton.Web, :view

  def render("index.json", %{flights: flights}) do
    %{data: render_many(flights, PhoenixHackaton.FlightView, "flight.json")}
  end

  def render("show.json", %{flight: flight}) do
    %{data: render_one(flight, PhoenixHackaton.FlightView, "flight.json")}
  end

  def render("flight.json", %{flight: flight}) do
    %{id: flight.id,
      flight_id: flight.flight_id,
      from: flight.from,
      to: flight.to,
      date: flight.flight_date
      }
  end
end
