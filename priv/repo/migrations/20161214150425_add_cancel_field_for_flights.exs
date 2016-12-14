defmodule PhoenixHackaton.Repo.Migrations.AddCancelFieldForFlights do
  use Ecto.Migration

  def change do
    alter table(:flights) do
      add :status, :string, default: "ok"
    end
  end
end
