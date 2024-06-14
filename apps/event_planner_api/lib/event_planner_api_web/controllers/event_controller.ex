defmodule EventPlannerAPIWeb.EventController do
  use EventPlannerAPIWeb, :controller
  use OpenApiSpex.ControllerSpecs
  alias EventPlanner

  alias EventPlannerAPIWeb.Schemas.{CreateSocialEventRequest, CreateSocialEventResponse}
  alias OpenApiSpex.{Operation, Schema}
  tags(["events"])

  operation(:create,
    summary: "Create social Event",
    request_body: {"Event params", "application/json", CreateSocialEventRequest},
    responses: %{
      201 =>
        {"Created", "application/json",
         %Schema{type: :object, properties: %{message: %Schema{type: :string}}}},
      400 =>
        {"Bad Request ", "application/json",
         %Schema{type: :object, properties: %{errors: %Schema{type: :object}}}},
      422 =>
        {"Unprocessable Entity", "application/json",
         %Schema{type: :object, properties: %{errors: %Schema{type: :object}}}}
    }
  )

  def create(conn, params) do
    # Transform data if necessary (e.g., convert strings to dates)
    event_params = prepare_event_params(params)

    case EventPlanner.create_social_event(event_params) do
      {:ok, event} ->
        conn
        |> put_status(:created)
        |> json(%{message: "Event created successfully"})

      {:error, :invalid_command_attributes} ->
        conn
        |> put_status(:bad_request)
        |> json(:invalid_command_attributes)

      {:error, reason} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(reason)
    end
  end

  defp prepare_event_params(params) do
    # Implement logic to convert data to the format expected by EventPlanner.create_social_event
    # This might involve converting string dates to proper date format, etc.
    params
  end
end
