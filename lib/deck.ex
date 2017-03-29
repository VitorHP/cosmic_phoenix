defmodule Cosmic.Deck do
  defstruct cards: []
  alias Cosmic.Card

  def new(type) do
    case type do
      :cosmic ->
        %__MODULE__{ cards: cosmic_deck }
      :tech ->
        %__MODULE__{ cards: tech_deck }
      :destiny ->
        %__MODULE__{ cards: destiny_deck }
    end
  end

  def shuffle(deck) do
    %__MODULE__{
      cards: deck.cards |> Enum.shuffle
    }
  end

  def buy(%__MODULE__{ cards: []} = deck), do: { nil, deck }
  def buy(deck) do
    [ head | tail ] = deck.cards

    {
      head,
      %__MODULE__{
        cards: tail
      }
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

  defp tech_deck do
    [
      {1, :coldsleep_ship, 9},
      {1, :collapsium_hulls, 4},
      {1, :cosmic_field_generator, 2},
      {1, :delta_scanners, 2},
      {1, :energy_hulls, 4},
      {1, :enigma_device, 4},
      {1, :genesis_bomb, 4},
      {1, :gluon_mines,"x"},
      {1, :infinity_drive, 6},
      {1, :lunar_cannon, 5},
      {1, :omega_misssile, 8},
      {1, :plasma_thrusters, 6},
      {1, :precursor_seed, 9},
      {1, :quark_battery, 3},
      {1, :tech_scrambler,"x"},
      {1, :the_prometheus, 7},
      {1, :the_qax, 4},
      {1, :vacuum_turbines, 2},
      {1, :warpspace_key, 3},
      {1, :xenon_lasers, 3}
    ]
    |> Enum.flat_map(fn({count, type, value}) ->
      1..count |> Enum.map(fn(_) -> %Card{ type: type, cost: value } end)
    end)
  end

  defp destiny_deck do
    [
      {3, :blue},
      {3, :green},
      {3, :purple},
      {3, :red},
      {3, :yellow},
      {2, :wild},
      {3, :special}
    ]
    |> Enum.flat_map(fn({count, value}) ->
      1..count |> Enum.map(fn(_) -> %Card{ type: :destiny, value: value } end)
    end)
  end
end
