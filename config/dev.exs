use Mix.Config

# Common development configuration
config :cosgoda, CosgodaWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Configure your database
config :cosgoda, Cosgoda.Repo,
  username: "postgres",
  password: "postgres",
  database: "cosgoda_dev",
  hostname: "localhost",
  pool_size: 10
