defmodule PhoenixHackaton.Repo.Migrations.CreateFlight do
  use Ecto.Migration

  def change do
    create table(:flights) do
      add :flight_id, :string

      timestamps()
    end

  end
end
