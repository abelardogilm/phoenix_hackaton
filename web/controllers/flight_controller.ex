defmodule PhoenixHackaton.FlightController do
  use PhoenixHackaton.Web, :controller

  alias PhoenixHackaton.Flight
  alias PhoenixHackaton.User

  def index(conn, _params) do
    flights = Repo.all(Flight)
    render(conn, "index.json", flights: flights)
  end

  def create(conn, %{"flight" => flight_params}) do
    changeset = Flight.changeset(%Flight{}, flight_params)

    case Repo.insert(changeset) do
      {:ok, flight} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", flight_path(conn, :show, flight))
        |> render("show.json", flight: flight)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixHackaton.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    flight = Repo.get!(Flight, id)
    render(conn, "show.json", flight: flight)
  end

  def update(conn, %{"id" => id, "flight" => flight_params}) do
    flight = Repo.get!(Flight, id)
    changeset = Flight.changeset(flight, flight_params)

    case Repo.update(changeset) do
      {:ok, flight} ->
        render(conn, "show.json", flight: flight)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixHackaton.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    flight = Repo.get!(Flight, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(flight)

    send_resp(conn, :no_content, "")
  end
end
