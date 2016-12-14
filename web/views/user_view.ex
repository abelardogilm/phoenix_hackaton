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
      email: user.email}
  end
end
