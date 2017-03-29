defmodule Cosmic.Game do
  defstruct players: [], destiny_deck: nil, tech_deck: nil, cosmic_deck: nil

  alias Cosmic.Player
  alias Cosmic.Planet
  alias Cosmic.Deck

  def new do
    %__MODULE__{
      destiny_deck: Deck.new(:destiny) |> Enum.shuffle,
      tech_deck: Deck.new(:tech) |> Enum.shuffle,
      cosmic_deck: Deck.new(:tech) |> Enum.shuffle,
    }
  end

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
