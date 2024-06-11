defmodule EventPlannerAPIWeb.EventController do
  use EventPlannerAPIWeb, :controller
  alias EventPlanner

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
