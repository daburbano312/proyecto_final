import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :search_players_app, SearchPlayersApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "search_players_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :search_players_app, SearchPlayersAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "T/Cr9zABJo3Nn8Pna9unLtcdVGILaToYuDMBgpTqi6Cc4DODshO7K9j7Wctv4W7j",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
