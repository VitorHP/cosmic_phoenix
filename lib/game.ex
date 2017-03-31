require IEx;

defmodule Cosmic.Game do
  defstruct players: [], destiny_deck: nil, tech_deck: nil, cosmic_deck: nil

  alias Cosmic.Player
  alias Cosmic.Planet
  alias Cosmic.Deck

  def new do
    %__MODULE__{
      destiny_deck: Deck.new(:destiny) |> Enum.shuffle,
      tech_deck: Deck.new(:tech) |> Enum.shuffle,
      cosmic_deck: Deck.new(:cosmic) |> Enum.shuffle,
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

  def start(%__MODULE__{ players: players } = game) when length(players) < 3, do: {:error, "Needs at least 3 players"}
  def start(game) do

  end

  def deal_cosmic_cards(game) do
    { players, cosmic_deck } =
    0..(length(game.players) * 8 - 1)
    |> Enum.reduce({game.players, game.cosmic_deck}, fn(index, acc) ->
      {players, cards} = acc

      {
        List.update_at(players, 0, &Player.deal_cosmic_card(&1, cards |> hd)),
        cards |> Enum.drop(1)
      }

    end)

    %__MODULE__{ game |
      players: players,
      cosmic_deck: cosmic_deck
    }
  end

end
