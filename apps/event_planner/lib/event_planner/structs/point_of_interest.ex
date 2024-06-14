defmodule EventPlanner.PointOfInterest do
  defstruct [
    :title,
    :description,
    :latitude,
    :longitude
  ]

  use ExConstructor
  use Vex.Struct

  validates(:title, presence: [message: "Required field"])
  validates(:description, presence: [message: "Required field"])
  validates(:latitude, presence: true, number: true)
  validates(:longitude, presence: true, number: true)
end
