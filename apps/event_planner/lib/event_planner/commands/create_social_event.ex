defmodule EventPlanner.Commands.CreateSocialEvent do
  alias EventPlanner.Commands.{CreateSocialEvent}

  defstruct [
    :event_id,
    :title,
    :description,
    :point_of_interest,
    :event_type,
    :event_date,
    :duration,
    :number_of_participants,
    :is_private,
    :logo_url,
    :background_url
  ]

  use ExConstructor
  use Vex.Struct

  validates(:event_id, uuid: true)
  validates(:title, presence: [message: "Required field"])
  validates(:description, presence: [message: "Required field"])
  validates(:point_of_interest, presence: true, by: &__MODULE__.validate_point_of_interest/2)
  validates(:event_type, presence: true)
  validates(:event_date, presence: [message: "Required field"])
  validates(:duration, presence: [message: "Required field"], number: true)

  validates(:duration,
    presence: [message: "Duration is required"],
    number: [is: true, message: "Duration must be a number"]
  )

  validates(:number_of_participants, presence: true, number: true)

  def validate_point_of_interest(raw, _) do
    attrs =
      case raw do
        nil -> %{}
        _ -> raw
      end

    poi = EventPlanner.PointOfInterest.new(attrs)
    Vex.valid?(poi)
  end

  def assign_id(%CreateSocialEvent{} = create_social_event, event_id) do
    %CreateSocialEvent{create_social_event | event_id: event_id}
  end

  def generate_id(%CreateSocialEvent{} = create_social_event) do
    %CreateSocialEvent{create_social_event | event_id: UUID.uuid4()}
  end
end
