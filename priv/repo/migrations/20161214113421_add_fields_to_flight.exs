defmodule PhoenixHackaton.Repo.Migrations.AddFieldsToFlight do
  use Ecto.Migration

  def change do
    alter table(:flights) do
      add :flight_date, :datetime
      add :from, :string
      add :to, :string
    end
  end
end
