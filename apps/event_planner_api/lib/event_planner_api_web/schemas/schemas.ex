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
        geoLocation: %Schema{
          type: :object,
          properties: %{
            title: %Schema{type: :string},
            description: %Schema{type: :string},
            latitude: %Schema{type: :number},
            longitude: %Schema{type: :number}
          }
        },
        eventType: %Schema{type: :string},
        eventDate: %Schema{type: :string, format: :"date-time"},
        duration: %Schema{type: :integer},
        numberOfParticipants: %Schema{type: :integer},
        isPrivate: %Schema{type: :boolean},
        logoUrl: %Schema{type: :string},
        backgroundUrl: %Schema{type: :string}
      },
      required: [:title, :description, :geoLocation, :eventType, :eventDate]
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
        geoLocation: %Schema{
          type: :object,
          properties: %{
            title: %Schema{type: :string},
            description: %Schema{type: :string},
            latitude: %Schema{type: :number},
            longitude: %Schema{type: :number}
          }
        },
        eventType: %Schema{type: :string},
        eventDate: %Schema{type: :string, format: :"date-time"},
        duration: %Schema{type: :integer},
        numberOfParticipants: %Schema{type: :integer},
        isPrivate: %Schema{type: :boolean},
        logoUrl: %Schema{type: :string},
        backgroundUrl: %Schema{type: :string}
      }
    })
  end
end
