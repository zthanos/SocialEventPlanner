defmodule EventPlanner.Application do
  use Application

  @impl true
  def start(_start_type, _start_args) do
    children = [
      EventPlanner.App,
      EventPlanner.Repo,
      # EventPlanner.EventStore

    ]
    opts = [strategy: :one_for_one, name: EventPlanner.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
