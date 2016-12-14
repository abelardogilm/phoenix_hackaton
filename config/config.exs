# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_hackaton,
  ecto_repos: [PhoenixHackaton.Repo]

# Configures the endpoint
config :phoenix_hackaton, PhoenixHackaton.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mDGTzd5PHGfzJLnCy7Z4MAEYxmTkTRqS9gJ4nWqLSTAtkxQRVDG19s3/YTQXF2/r",
  render_errors: [view: PhoenixHackaton.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixHackaton.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
