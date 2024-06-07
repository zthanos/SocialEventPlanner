import Config

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
    serializer: Commanded.Serialization.JsonSerializer,
  ]

config :event_planner, EventPlanner.EventStore,
  serializer: Commanded.Serialization.JsonSerializer



# Print only warnings and errors during test
config :logger, level: :warning
