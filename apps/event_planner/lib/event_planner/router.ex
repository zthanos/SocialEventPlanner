defmodule EventPlanner.Router do
  use Commanded.Commands.Router

  alias EventPlanner.{SocialEventAggregate}
  alias EventPlanner.Commands.{CreateSocialEvent}

  @social_event_prefix "social-event-"

  identify(SocialEventAggregate, by: :event_id, prefix: @social_event_prefix)

  dispatch([CreateSocialEvent], to: SocialEventAggregate)
end
