defmodule EventPlanner.Infrastructure.CommandExecutor do
  @behaviour EventPlanner.Infrastructure.CommandExecution

  require Logger

  @spec execute_command(any(), keyword()) :: {:ok, any()} | {:error, any()}
  def execute_command(cmd, opts \\ []) do
    Logger.debug("Executing command: #{inspect(cmd)}")


    case EventPlanner.App.dispatch(cmd, opts) do
      {:ok, item} ->
        {:ok, item}

      {:error, reason} ->
        Logger.error("Failed executing command: #{inspect(cmd)}\nReason: #{inspect(reason)}")
        {:error, reason}

      reason ->
        Logger.error("Unexpected error executing command: #{inspect(cmd)}\nReason: #{inspect(reason)}")
        {:error, reason}
    end
  end
end
