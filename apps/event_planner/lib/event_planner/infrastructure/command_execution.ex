defmodule EventPlanner.Infrastructure.CommandExecution do
  @callback execute_command(any(), keyword()) :: {:ok, any()} | {:error, any()}
end
