defmodule Cosmic.Deck do
  defstruct cards: []
  alias Cosmic.Card

  def new(type) do
    case type do
      :cosmic ->
        %__MODULE__{ cards: cosmic_deck }
    end
  end

  def shuffle(deck) do
    %__MODULE__{
      cards: deck.cards |> Enum.shuffle
    }
  end

  defp cosmic_deck do
    [
      { 1, :attack,          0 },
      { 1, :attack,          1 },
      { 4, :attack,          4 },
      { 1, :attack,          5 },
      { 7, :attack,          6 },
      { 1, :attack,          7 },
      { 7, :attack,          8 },
      { 1, :attack,          9 },
      { 4, :attack,          10},
      { 1, :attack,          11},
      { 2, :attack,          12},
      { 1, :attack,          13},
      { 2, :attack,          14},
      { 1, :attack,          15},
      { 2, :attack,          20},
      { 1, :attack,          23},
      { 1, :attack,          30},
      { 1, :attack,          40},
      { 1, :morph,           nil},
      {15, :negotiate,       nil},
      { 2, :reinforcement,   2},
      { 3, :reinforcement,   3},
      { 1, :reinforcement,   5},
      { 2, :card_zap,        nil},
      { 2, :cosmic_zap,      nil},
      { 1, :emotion_control, nil},
      { 1, :force_field,     nil},
      { 1, :ionic_gas,       nil},
      { 2, :moebius_tubes,   nil},
      { 1, :plague,          nil},
      { 1, :quash,           nil}
    ]
    |> Enum.flat_map(fn({count, type, value}) ->
      1..count |> Enum.map(fn(_) -> %Card{ type: type, value: value } end)
    end)
  end
end
