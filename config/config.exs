# # This file is responsible for configuring your umbrella
# # and **all applications** and their dependencies with the
# # help of the Config module.
# #
# # Note that all applications in your umbrella share the
# # same configuration and dependencies, which is why they
# # all use the same configuration file. If you want different
# # configurations or dependencies per app, it is best to
# # move said applications out of the umbrella.
# # This file is responsible for configuring your application
# # and its dependencies with the aid of the Config module.
# #
# # This configuration file is loaded before any dependency and
# # is restricted to this project.

# # General application configuration
# import Config

# config :event_planner,
#   ecto_repos: [EventPlanner.Repo]

# config :event_planner, EventPlanner.App,
#   event_store: [
#     adapter: Commanded.EventStore.Adapters.EventStore,
#     event_store: EventPlanner.EventStore
#   ],
#   pub_sub: :local,
#   registry: :local

# config :event_planner, EventPlanner.EventStore, serializer: Commanded.Serialization.JsonSerializer

# config :commanded,
#   event_store_adapter: Commanded.EventStore.Adapters.EventStore

# config :event_planner_api,
#   namespace: EventPlannerAPI,
#   generators: [timestamp_type: :utc_datetime]

# # Configures the endpoint
# config :event_planner_api, EventPlannerAPIWeb.Endpoint,
#   url: [host: "localhost"],
#   adapter: Bandit.PhoenixAdapter,
#   render_errors: [
#     formats: [json: EventPlannerAPIWeb.ErrorJSON],
#     layout: false
#   ],
#   pubsub_server: EventPlannerAPI.PubSub,
#   live_view: [signing_salt: "AlfXeXG2"]

# # Configures the mailer
# #
# # By default it uses the "Local" adapter which stores the emails
# # locally. You can see the emails in your browser, at "/dev/mailbox".
# #
# # For production it's recommended to configure a different adapter
# # at the `config/runtime.exs`.
# config :event_planner_api, EventPlannerAPI.Mailer, adapter: Swoosh.Adapters.Local

# # Configure esbuild (the version is required)
# config :esbuild,
#   version: "0.17.11",
#   event_planner_api: [
#     args:
#       ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
#     cd: Path.expand("../apps/event_planner_api/assets", __DIR__),
#     env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
#   ]

# # Configure tailwind (the version is required)
# config :tailwind,
#   version: "3.4.0",
#   event_planner_api: [
#     args: ~w(
#       --config=tailwind.config.js
#       --input=css/app.css
#       --output=../priv/static/assets/app.css
#     ),
#     cd: Path.expand("../apps/event_planner_api/assets", __DIR__)
#   ]

# # Configures Elixir's Logger
# config :logger, :console,
#   format: "$time $metadata[$level] $message\n",
#   metadata: [:request_id]

# # Use Jason for JSON parsing in Phoenix
# config :phoenix, :json_library, Jason

# # Import environment specific config. This must remain at the bottom
# # of this file so it overrides the configuration defined above.
# import_config "#{config_env()}.exs"

# # Sample configuration:
# #
# #     config :logger, :console,
# #       level: :info,
# #       format: "$date $time [$level] $metadata$message\n",
# #       metadata: [:user_id]
# #


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

config :event_planner_api,
  namespace: EventPlannerAPI,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :event_planner_api, EventPlannerAPIWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: EventPlannerAPIWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: EventPlannerAPI.PubSub,
  live_view: [signing_salt: "AlfXeXG2"]

# Configures the mailer
config :event_planner_api, EventPlannerAPI.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  event_planner_api: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/event_planner_api/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  event_planner_api: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../apps/event_planner_api/assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
