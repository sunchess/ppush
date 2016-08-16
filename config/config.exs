# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ppush,
  ecto_repos: [Ppush.Repo]

# Configures the endpoint
config :ppush, Ppush.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s1Bl3v6iE1827yQVfFlWCroHJ9DwUkSuCmxzScNfbhhhiZPJ+RAwWaibcQ9N0sHN",
  render_errors: [view: Ppush.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ppush.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

#Slim engine
config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine,
    slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
