defmodule EventPlannerAPIWeb.Router do
  use EventPlannerAPIWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  pipeline :api do
    plug(:accepts, ["json"])
    plug(OpenApiSpex.Plug.PutApiSpec, module: EventPlannerAPIWeb.ApiSpec)
  end

  scope "/" do
    # Use the default browser stack
    pipe_through(:browser)

    get("/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/api/openapi")
  end

  scope "/api" do
    pipe_through(:api)

    resources("/events", EventPlannerAPIWeb.EventController, only: [:create])
    forward "/openapi", OpenApiSpex.Plug.RenderSpec, spec: EventPlannerAPIWeb.ApiSpec

  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:event_planner_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      live_dashboard("/dashboard", metrics: EventPlannerAPIWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
