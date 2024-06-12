defmodule EventPlannerAPIWeb.EventController do
  use EventPlannerAPIWeb, :controller
  use OpenApiSpex.ControllerSpecs
  alias EventPlanner

  alias EventPlannerAPIWeb.Schemas.{CreateSocialEventRequest, CreateSocialEventResponse}

  tags ["events"]
  # security [%{}, %{"petstore_auth" => ["write:users", "read:users"]}]

  operation :create,
    summary: "Create social Event",
    parameters: [
      event_id: [in: :path, description: "Event id", type: :string, example: "0000000000000000"],
      title: [in: :path, description: "Title", type: :string, example: "1001"],
      description: [in: :path, description: "description", type: :string, example: "1001"],
      event_date: [in: :path, description: "event_date", type: :string, example: "1001"],
      event_type: [in: :path, description: "event_type", type: :string, example: "1001"],
      is_private: [in: :path, description: "is_private", type: :string, example: "1001"],
      logo_url: [in: :path, description: "logo_url", type: :string, example: "1001"],
      background_url: [in: :path, description: "background_url", type: :string, example: "1001"],
      number_of_participants: [in: :path, description: "number_of_participants", type: :string, example: 100]
    ],
    request_body: {"User params", "application/json", CreateSocialEventRequest},
    responses: [
      ok: {"User response", "application/json", CreateSocialEventResponse}
    ]

  def create(conn, %{"event" => event_params}) do
    case EventPlanner.create_social_event(event_params) do
      :ok ->
        conn
        |> put_status(:created)
        |> json(%{message: "Event created successfully"})

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: changeset})
    end
  end
end
