defmodule EventPlanner.Infrastructure.Validations.ValidationHelper do
  require Logger

  def validate_command(cmd, changeset, validator) do
    Logger.debug("Validating command: #{inspect(cmd)}")
    Vex.errors(cmd) |> dbg()

    case validator.valid?(cmd) do
      true ->
        changeset

      false ->
        # Logger.debug("Validating command: #{Vex.errors(cmd)}")
        changeset |> update_cmd_error(Vex.errors(cmd))
    end
  end

  def update_cmd_error(changeset, errors) do
    errors |> dbg()
    Enum.reduce(Enum.to_list(errors), changeset, fn {_error, key, _type, value}, acc_changeset ->
      Ecto.Changeset.add_error(acc_changeset, key, value)
    end)
  end
end
