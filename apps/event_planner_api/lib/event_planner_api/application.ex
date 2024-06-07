defmodule EventPlannerAPI.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EventPlannerAPIWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:event_planner_api, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EventPlannerAPI.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EventPlannerAPI.Finch},
      # Start a worker by calling: EventPlannerAPI.Worker.start_link(arg)
      # {EventPlannerAPI.Worker, arg},
      # Start to serve requests, typically the last entry
      EventPlannerAPIWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EventPlannerAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EventPlannerAPIWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
