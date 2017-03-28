defmodule Cosmic.Planet do
  defstruct color: nil, id: nil, ships: %{}

  def new(color, ships) do
    %__MODULE__{
      color: color,
      ships: %{ color => ships }
    }
  end

  def add_ships(planet, {color, amount}) do
    %__MODULE__{ planet |
      ships: Map.update(planet.ships,
                        color,
                        amount,
                        fn(initial) -> initial + amount end) }
  end

  def remove_ships(planet, {color, amount}) do
    %__MODULE__{ planet |
      ships: Map.update(planet.ships, color, amount, fn
                          initial when initial - amount >= 0 -> initial - amount
                          initial -> initial
                        end)
    }
  end

  def has_control?(planet, color) do
    planet.color == color && Map.get(planet.ships, color, 0) > 0
  end

  def has_colony?(planet, color) do
    planet.color != color && Map.get(planet.ships, color, 0) > 0
  end

  def colony_colors(planet) do
    planet
    |> Map.get(:ships)
    |> Map.keys
    |> Enum.filter(&( &1 != planet.color ))
  end
end
