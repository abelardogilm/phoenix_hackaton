defmodule PhoenixHackaton.UserView do
  use PhoenixHackaton.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, PhoenixHackaton.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, PhoenixHackaton.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      slack_id: user.slack_id,
      lat: user.lat,
      lon: user.lon,
      impact: user.impact,
      email: user.email,
      booking_office: user.booking_office,
      booking_date: user.booking_date,
      ticket_status: user.ticket_status,
      employee_id: user.employee_id,
      vip_status: user.vip_status,
      last_name: user.last_name,
      departure_date: user.departure_date,
      arrival_date: user.arrival_date,
      airline: user.airline,
      travel_class: user.travel_class,
      booking_type: user.booking_type,
    }
  end
end
