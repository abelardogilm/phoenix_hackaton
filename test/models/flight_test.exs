defmodule PhoenixHackaton.FlightTest do
  use PhoenixHackaton.ModelCase

  alias PhoenixHackaton.Flight

  @valid_attrs %{flight_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Flight.changeset(%Flight{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Flight.changeset(%Flight{}, @invalid_attrs)
    refute changeset.valid?
  end
end
