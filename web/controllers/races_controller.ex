defmodule Cosmic.RacesController do
  use Cosmic.Web, :controller

  def index(conn, _params) do
    races = File.read!(races_file)
      |> Poison.decode!()
      |> Enum.sort(fn(a, b) -> normalized_race_name(a["name"]) < normalized_race_name(b["name"]) end)

    # json conn, races
    render conn, "index.html", races: races
  end

  def show(conn, %{"name" => name}) do
    race = File.read!(races_file) |> Poison.decode!() |> race_with_name(name)

    render conn, "show.html", race: race
  end

  defp races_file() do
    Path.join(:code.priv_dir(:cosmic), "data/races.json")
  end

  defp race_with_name(races, name) do
    Enum.find(races, nil, fn(r) -> Regex.match?(~r/#{name}/i, r["name"]) end)
  end

  defp normalized_race_name(race_name) do
    race_name
    |> String.normalize(:nfd)
    |> String.replace(~r/[^A-z\s]/u, "")
    |> String.replace(~r/\s/, "-")
  end
end
