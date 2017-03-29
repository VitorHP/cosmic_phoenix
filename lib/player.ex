defmodule Cosmic.Player do
  defstruct color: nil, planets: [], cosmic_cards: []
  alias Cosmic.Planet

  def new(color) do
    %__MODULE__{
      color: color,
      planets: 1..5 |> Enum.map(fn(_) -> Planet.new(color, 4) end)
    }
  end

  def deal_cosmic_card(player, card) do
    %__MODULE__{ player |
      cosmic_cards: [ card | player.cosmic_cards ]
    }
  end
end
