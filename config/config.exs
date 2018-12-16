use Mix.Config

config :cosgoda, ecto_repos: [Cosgoda.Repo]

# Configures the endpoint
config :cosgoda,
       CosgodaWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "qpIjdnSU6V+wut+VUEOq/ogHdojx4WtrxRGtvVUI8B6I9nKYDOJmyQmFE4bJFP/4",
       render_errors: [
         view: CosgodaWeb.ErrorView,
         accepts: ~w(json)
       ],
       pubsub: [
         name: Cosgoda.PubSub,
         adapter: Phoenix.PubSub.PG2
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Poison for JSON parsing in Phoenix
config :phoenix, :json_library, Poison

# Guardian configuration
config :cosgoda,
       CosgodaWeb.Guardian,
       issuer: "cosgoda",
       secret_key: "gimpqpbuuapYWKTXc9kqJ7tZasQQOAbldBU7HzU8g4hRDwjqKi7OWiGRiq/uzTTW"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
