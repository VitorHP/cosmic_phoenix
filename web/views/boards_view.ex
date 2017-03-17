defmodule Cosmic.BoardsView do
  use Cosmic.Web, :view

  def planets(race) do
    Enum.map(race.planets, fn(planet) -> planet |> lost(race.color) end)
  end

  def lost(planet, color) do
    Map.put(planet, :lost, planet.ships[color] == 0 )
  end

  def planet_classes(is_lost) do
    if ( is_lost ), do: "player__planet player__planet--lost", else: "player__planet"
  end

  def ships(ships) do
    Enum.map(ships, fn({k, v}) -> %{color: k, count: v} end)
  end

  def total_ships(planets, color) do
    planets
    |> Enum.map(fn(planet) -> Map.fetch!(planet, :ships) end)
    |> Enum.map(fn(ships) -> Map.get(ships, color, 0) end)
    |> Enum.sum
  end

  def score(players) do
    players
    |> Enum.map(fn(player) -> %{color: player.color, points: player_score(players, player.color)} end)
  end

  def player_score(players, color) do
    players
    |> Enum.filter(fn(player) -> player.color !== color end)
    |> Enum.map(fn(player) -> total_ships(player.planets, color) end)
    |> Enum.reduce(0, fn(ships_on_colony, acc) -> if ships_on_colony > 0, do: acc + 1, else: acc end)
  end

  def attacking(players) do
    List.first(players)
  end

  def defending(players) do
    List.last(players)
  end

  # def score_board(score) do
  #   score
  #   |> Enum.count
  #   |> fn(count) -> 0..count end.()
  #   |> Enum.map(fn(point) ->
  #     Enum.map(score, fn(player_score) ->
  #       if player_score.points >= point, do: player_score.color, else: ""
  #     end)
  #   end)
  # end
end
