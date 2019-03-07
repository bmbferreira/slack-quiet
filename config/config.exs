# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :slack_quiet, SlackQuietWeb.Endpoint,
  url: [host: "192.127.0.1"],
  secret_key_base: "CQNu6sCApWrWdBlu/yj+Q/Vydp0D+U0AllMAv/69mWISGjen4EluDDrnmgOXAhPF",
  render_errors: [view: SlackQuietWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SlackQuiet.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
