defmodule EventPlanner do
  alias EventPlanner.Commands.CreateSocialEvent
  alias EventPlanner.Infrastructure.CommandExecution
  alias EventPlanner.Infrastructure.CommandExecutor
  require Logger
  @behaviour CommandExecution

  defdelegate execute_command(cmd, opts), to: CommandExecutor

  def create_social_event(attrs) do
    cmd =
      attrs
      |> CreateSocialEvent.new()
      |> CreateSocialEvent.generate_id()

    if Vex.valid?(cmd) do
      execute_command(cmd, returning: :aggregate_state)
    else
      Logger.debug(inspect(Vex.errors(cmd)))
      {:error, "Invalid command attributes"}
    end
  end

end
