defmodule EventPlannerAPIWeb.ApiSpec do
  alias OpenApiSpex.{Info, OpenApi, Paths, Server}
  @behaviour OpenApi

  @impl OpenApi
  def spec do
    %OpenApi{
      servers: [
        # Populate the Server info from a phoenix endpoint
        Server.from_endpoint(EventPlannerAPIWeb.Endpoint)
      ],
      info: %Info{
        title: "Social Event Planner API",
        version: "1.0"
      },
      # Populate the paths from a phoenix router
      paths: Paths.from_router(EventPlannerAPIWeb.Router)
    }
    |> OpenApiSpex.resolve_schema_modules() # Discover request/response schemas from path specs
  end
end


# defmodule EventPlannerAPIWeb.ApiSpec do
#   @behaviour OpenApiSpex.Spec

#   alias OpenApiSpex.{Info, OpenApi, Paths, Server}

#   @impl OpenApiSpex.Spec
#   def spec do
#     %OpenApi{
#       info: %Info{
#         title: "Social Event Planner API",
#         version: "1.0"
#       },
#       servers: [%Server{url: "http://localhost:4000"}],
#       paths: %Paths{}
#     }
#   end
# end
