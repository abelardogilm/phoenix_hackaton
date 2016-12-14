defmodule PhoenixHackaton.User do
  use PhoenixHackaton.Web, :model

  schema "users" do
    field :name, :string
    field :slack_id, :string
    field :lat, :string
    field :lon, :string
    field :impact, :string
    field :email, :string

    field :booking_office, :string
    field :booking_date, Ecto.DateTime
    field :ticket_status, :string
    field :employee_id, :string
    field :vip_status, :string
    field :last_name, :string

    field :departure_date, Ecto.DateTime
    field :arrival_date, Ecto.DateTime
    field :airline, :string
    field :travel_class, :string
    field :booking_type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
