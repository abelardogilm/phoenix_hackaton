defmodule PhoenixHackaton.Repo.Migrations.AddRelationshipFromFlightAndUser do
  use Ecto.Migration

  def change do
    alter table(:flights) do
      add :user_id, :integer
    end
  end
end
