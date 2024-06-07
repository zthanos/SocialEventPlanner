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
    :background_url,
  ]

  use ExConstructor
  use Vex.Struct

  validates(:event_id, uuid: true)
  validates(:title, presence: [message: "Required field"], string: true)
  validates(:description, presence: [message: "Required field"], string: true)
  validates(:point_of_interest, presence: true, by: &__MODULE__.validate_point_of_interest/2)
  validates(:event_type, presence: true, string: true)
  validates(:event_date, presence: [message: "Required field"])
  validates(:duration, presence: true, number: true)
  validates(:number_of_participants, presence: true, number: true)
  validates(:is_private, presence: true, inclusion: [true, false])
  validates(:logo_url, url: true)
  validates(:background_url, url: true)

  def validate_point_of_interest(%{point_of_interest: point_of_interest}, _) do
    Vex.valid?(point_of_interest)
  end

  def assign_id(%CreateSocialEvent{} = create_social_event, event_id) do
    %CreateSocialEvent{create_social_event | event_id: event_id}
  end

  def generate_id(%CreateSocialEvent{} = create_social_event) do
    %CreateSocialEvent{create_social_event | event_id: UUID.uuid4()}
  end
end
