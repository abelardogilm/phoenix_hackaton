defmodule PhoenixHackaton.Repo.Migrations.AddFieldsToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :slack_id, :string
      add :lat, :string
      add :lon, :string
      add :impact, :string
      add :email, :string
    end
  end
end
