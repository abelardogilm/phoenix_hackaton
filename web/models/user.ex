defmodule PhoenixHackaton.User do
  use PhoenixHackaton.Web, :model

  schema "users" do
    field :name, :string
    field :slack_id, :string
    field :lat, :string
    field :lon, :string
    field :impact, :string
    field :email, :string
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
