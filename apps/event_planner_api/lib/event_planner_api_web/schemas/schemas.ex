defmodule EventPlannerAPIWeb.Schemas do
  require OpenApiSpex

  alias OpenApiSpex.Schema

  defmodule CreateSocialEventRequest do
    OpenApiSpex.schema(%{
      title: "CreateSocialEventRequest",
      description: "Parameters for creating a social event",
      type: :object,
      properties: %{
        title: %Schema{type: :string},
        description: %Schema{type: :string},
        point_of_interest: %Schema{
          type: :object,
          properties: %{
            title: %Schema{type: :string},
            description: %Schema{type: :string},
            latitude: %Schema{type: :number},
            longitude: %Schema{type: :number}
          }
        },
        event_type: %Schema{type: :string},
        event_date: %Schema{type: :string, format: :"date-time"},
        duration: %Schema{type: :integer},
        number_of_participants: %Schema{type: :integer},
        is_private: %Schema{type: :boolean},
        logo_url: %Schema{type: :string},
        background_url: %Schema{type: :string}
      },
      required: [:title, :description, :geoLocation, :event_type, :event_date]
    })
  end

  defmodule CreateSocialEventResponse do
    OpenApiSpex.schema(%{
      title: "CreateSocialEventResponse",
      description: "Response after creating a social event",
      type: :object,
      properties: %{
        id: %Schema{type: :string},
        title: %Schema{type: :string},
        description: %Schema{type: :string},
        point_of_interest: %Schema{
          type: :object,
          properties: %{
            title: %Schema{type: :string},
            description: %Schema{type: :string},
            latitude: %Schema{type: :number},
            longitude: %Schema{type: :number}
          }
        },
        event_type: %Schema{type: :string},
        event_date: %Schema{type: :string, format: :"date-time"},
        duration: %Schema{type: :integer},
        number_of_participants: %Schema{type: :integer},
        is_private: %Schema{type: :boolean},
        logo_url: %Schema{type: :string},
        background_url: %Schema{type: :string}
      }
    })
  end
end
