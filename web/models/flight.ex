defmodule PhoenixHackaton.Flight do
  use PhoenixHackaton.Web, :model

  schema "flights" do
    field :flight_id, :string
    field :flight_date, Ecto.DateTime
    field :from, :string
    field :to, :string
    field :status, :string
    field :origin_airport, :string
    field :destination_airport, :string
    field :flight_number, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:flight_id])
    |> validate_required([:flight_id])
  end
end
