defmodule EventPlanner.CommandExecutorMock do
  use Mox

  # Define the behaviour for the mock
  @behaviour EventPlanner.Infrastructure.CommandExecution

  # Set up the default expectations
  def execute_command(_, _), do: :ok
end
