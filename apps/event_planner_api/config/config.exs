import Config

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :open_api_spex, :cache_adapter, OpenApiSpex.Plug.NoneCache
import_config "#{config_env()}.exs"
