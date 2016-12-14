defmodule PhoenixHackaton.Router do
  use PhoenixHackaton.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixHackaton do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/flights", FlightController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixHackaton do
  #   pipe_through :api
  # end
end
