defmodule Cosmic.Game do
  defstruct players: []
  alias Cosmic.Player
  alias Cosmic.Planet

  def add_player(game, color) do
    %__MODULE__{ game |
      players: [ Player.new(color) | game.players ]
    }
  end

  def score(game) do
    game
    |> Map.get(:players)
    |> Enum.flat_map(&(Map.get(&1, :planets)))
    |> Enum.flat_map(&(Planet.colony_colors(&1)))
    |> Enum.reduce(%{}, fn(color, acc) -> Map.update(acc, color, 1, &(&1 + 1)) end)
  end

end
