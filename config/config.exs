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


config :guardian, Guardian,
  issuer: "Ppush.#{Mix.env}",
  ttl: {30, :days},
  verify_issuer: true,
  serializer: Ppush.GuardianSerializer,
  secret_key: "0bfde4c8d02120583bfbf38218a897d4637faeb9b1d9f33fb983dd68e28858182ca7cdcbcdae479bd413fe15033612b564648ab0bfaa170d7df736d002027655"


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
