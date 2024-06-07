defmodule EventPlanner.Events.SocialEventCreated do
  @derive Jason.Encoder

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
    :createdDate,
    :participants
  ]
end
