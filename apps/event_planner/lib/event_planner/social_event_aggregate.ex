defmodule EventPlanner.SocialEventAggregate do
  alias EventPlanner.{SocialEventAggregate}
  alias EventPlanner.Commands.{CreateSocialEvent}
  alias EventPlanner.Events.{SocialEventCreated}

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
    :created,
    :completed,
    :rating,
    :participants
  ]

  def execute(%SocialEventAggregate{event_id: nil}, %CreateSocialEvent{} = cmd) do
    %SocialEventCreated{
      event_id: cmd.event_id,
      title: cmd.title,
      description: cmd.description,
      point_of_interest: cmd.point_of_interest,
      event_type: cmd.event_type,
      event_date: cmd.event_date,
      duration: cmd.duration,
      number_of_participants: cmd.number_of_participants,
      is_private: cmd.is_private,
      logo_url: cmd.logo_url,
      background_url: cmd.background_url,
      participants: []
    }
  end

  # state mofifiers
  def apply(%SocialEventAggregate{} = aggregate, %SocialEventCreated{} = event) do
    %SocialEventAggregate{
      aggregate
      | event_id: event.event_id,
        title: event.title,
        description: event.description,
        point_of_interest: event.point_of_interest,
        event_type: event.event_type,
        event_date: event.event_date,
        duration: event.duration,
        number_of_participants: event.number_of_participants,
        is_private: event.is_private,
        logo_url: event.logo_url,
        background_url: event.background_url,
        participants: event.participants
    }
  end
end
