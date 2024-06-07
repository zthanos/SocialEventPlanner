import Config

# Configure database
config :event_planner, EventPlanner.Repo,
  username: "postgres",
  password: System.get_env("EVENT_PLANNER_PASSWORD"),
  hostname: "127.0.0.1",
  database: "event_planner",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :event_planner, EventPlanner.EventStore,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: System.get_env("EVENT_PLANNER_PASSWORD"),
  hostname: "127.0.0.1",
  database: "event_planner_eventstore",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
