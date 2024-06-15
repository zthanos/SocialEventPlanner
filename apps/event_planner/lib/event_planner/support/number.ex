defmodule EventPlanner.Support.Validators.Number do
  use Vex.Validator

  def validate(nil, _options), do: :ok
  def validate("", _options), do: :ok

  def validate(value, _options) do
    Vex.Validators.Number.validate(value, is: true)
    # Vex.Validators.Number.validate(value, Keyword.put_new(options, :is, true))

  end
end
