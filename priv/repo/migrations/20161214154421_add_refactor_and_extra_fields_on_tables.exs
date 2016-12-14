defmodule PhoenixHackaton.Repo.Migrations.AddRefactorAndExtraFieldsOnTables do
  use Ecto.Migration

  def change do
    alter table(:flights) do
      add :origin_airport, :string
      add :destination_airport, :string
      add :flight_number, :string
    end
    alter table(:users) do
      add :booking_office, :string
      add :booking_date, :datetime
      add :ticket_status, :string
      add :employee_id, :string
      add :vip_status, :string
      add :last_name, :string

      add :departure_date, :datetime
      add :arrival_date, :datetime
      add :airline, :string
      add :travel_class, :string
      add :booking_type, :string
    end
  end
end
