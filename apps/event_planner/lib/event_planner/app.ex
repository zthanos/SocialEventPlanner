defmodule EventPlanner.App do
  use Commanded.Application, otp_app: :event_planner

  router(EventPlanner.Router)
end
