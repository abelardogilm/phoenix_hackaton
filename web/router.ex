defmodule PhoenixHackaton.Router do
  use PhoenixHackaton.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
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
  end

  # Other scopes may use custom stacks.
  scope "/api", PhoenixHackaton do
    pipe_through :api
    resources "/flights", FlightController, except: [:new, :edit]
    # This is a fake "ñapa", do it better later
    post "/flights/:id/cancelled/:day", FlightController, :cancelled, as: :cancel_flight
    get "/flights/:id/users", UserController, :index, as: :flight_users
    get "/flights/:flight/users/:id/options", UserController, :options, as: :user_options
    resources "/users", UserController, except: [:new, :edit]
  end
end
