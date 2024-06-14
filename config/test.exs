import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :event_planner_api, EventPlannerAPIWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MYPOaQMKtURmJE03lu0WnAyDeEtJ5S3vnyKbB+ioMhJo9uJ8CaJdEF5sEnmUKo/z",
  server: false

config :event_planner, EventPlanner.Repo,
  username: "postgres",
  password: System.get_env("EVENT_PLANNER_PASSWORD"),
  hostname: "127.0.0.1",
  database: "event_planner_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :event_planner, EventPlanner.App,
  event_store: [
    adapter: Commanded.EventStore.Adapters.InMemory,
    serializer: Commanded.Serialization.JsonSerializer
  ]

# In test we don't send emails.
config :event_planner_api, EventPlannerAPI.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :debug

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true
