defmodule EventPlanner.Repo.Migrations.Initial do
  use Ecto.Migration

  def change do
    create table(:social_events) do
      add :event_id, :uuid, primary_key: true
      add :title, :string
      add :description, :string
      add :event_type, :integer
      add :event_date, :naive_datetime
      add :duration, :integer
      add :number_of_participants, :integer
      add :is_private, :boolean
      add :logo_url, :string
      add :background_url, :string
      add :created, :naive_datetime
      add :completed, :naive_datetime
      add :rating, :integer

      # Fields for PointOfInterest
      add :poi_title, :string
      add :poi_description, :string
      add :poi_latitude, :float
      add :poi_longitude, :float

      timestamps()
    end

  end
end
