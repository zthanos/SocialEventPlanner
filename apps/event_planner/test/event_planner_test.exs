defmodule EventPlannerTest do
  use ExUnit.Case, async: true

  import Mox
  # alias EventPlanner.{Commands.CreateSocialEvent, CommandExecutorMock}

  setup :verify_on_exit!

  describe "create_social_event/1" do
    test "successfully creates a social event" do
      attrs = %{
        title: "Sample Event",
        description: "This is a sample event",
        point_of_interest: %{
          title: "Location Title",
          description: "Location Description",
          latitude: 12.34,
          longitude: 56.78
        },
        eventType: "Conference",
        eventDate: "2024-07-15T18:00:00Z",
        duration: 180,
        numberOfParticipants: 50,
        is_private: false,
        logoUrl: "https://example.com/logo.png",
        backgroundUrl: "https://example.com/background.jpg"
      }

      # cmd = CreateSocialEvent.new(attrs)

      # CommandExecutorMock
      # |> expect(:execute_command, fn ^cmd, [returning: :aggregate_state] ->
      #   {:ok, %CreateSocialEvent{}}
      # end)

      # Application.put_env(:event_planner, :command_executor, CommandExecutorMock)
      result = EventPlanner.create_social_event(attrs)
      assert {:ok, _} = result
    end

    test "fails to create a social event with invalid data" do
      attrs = %{
        # invalid title
        title: nil,
        description: "This is a sample event",
        geoLocation: %{
          title: "Location Title",
          description: "Location Description",
          latitude: 12.34,
          longitude: 56.78
        },
        eventType: "Conference",
        eventDate: "2024-07-15T18:00:00Z",
        duration: 180,
        numberOfParticipants: 50,
        is_private: false,
        logoUrl: "https://example.com/logo.png",
        backgroundUrl: "https://example.com/background.jpg"
      }

      # cmd = CreateSocialEvent.new(attrs)

      # CommandExecutorMock
      # |> expect(:execute_command, fn ^cmd, [returning: :aggregate_state] ->
      #   {:error, %Ecto.Changeset{}}
      # end)

      # Application.put_env(:event_planner, :command_executor, CommandExecutorMock)
      result = EventPlanner.create_social_event(attrs)
      assert {:error, _changeset} = result
    end
  end
end
