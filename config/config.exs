# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ybrikam,
  ecto_repos: [Ybrikam.Repo]

# Configures the endpoint
config :ybrikam, Ybrikam.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d6pOQ/pxBXRGSGpV7CW1HPAa/IQbOW/1cJ5ZDTglYITirCUxn/Jp5IF1xJLNDKeO",
  render_errors: [view: Ybrikam.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ybrikam.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
