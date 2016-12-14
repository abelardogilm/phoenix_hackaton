defmodule PhoenixHackaton.PageController do
  use PhoenixHackaton.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
