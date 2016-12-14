defmodule PhoenixHackaton.FlightControllerTest do
  use PhoenixHackaton.ConnCase

  alias PhoenixHackaton.Flight
  @valid_attrs %{flight_id: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, flight_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    flight = Repo.insert! %Flight{}
    conn = get conn, flight_path(conn, :show, flight)
    assert json_response(conn, 200)["data"] == %{"id" => flight.id,
      "flight_id" => flight.flight_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, flight_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, flight_path(conn, :create), flight: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Flight, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, flight_path(conn, :create), flight: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    flight = Repo.insert! %Flight{}
    conn = put conn, flight_path(conn, :update, flight), flight: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Flight, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    flight = Repo.insert! %Flight{}
    conn = put conn, flight_path(conn, :update, flight), flight: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    flight = Repo.insert! %Flight{}
    conn = delete conn, flight_path(conn, :delete, flight)
    assert response(conn, 204)
    refute Repo.get(Flight, flight.id)
  end
end
