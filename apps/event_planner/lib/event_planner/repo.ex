defmodule EventPlanner.Repo do
  use Ecto.Repo,
  otp_app: :event_planner,
  adapter: Ecto.Adapters.Postgres
end
