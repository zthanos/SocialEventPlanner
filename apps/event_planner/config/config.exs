import Config

config :event_planner,
  ecto_repos: [EventPlanner.Repo],
  event_stores: [EventPlanner.EventStore]

config :event_planner, EventPlanner.App,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: EventPlanner.EventStore
  ],
  pub_sub: :local,
  registry: :local

config :event_planner, EventPlanner.EventStore, serializer: Commanded.Serialization.JsonSerializer

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :vex,
  sources: [
    EventPlanner.Support.Validators,
    Vex.Validators
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{config_env()}.exs"
