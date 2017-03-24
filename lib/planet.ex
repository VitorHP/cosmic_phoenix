defmodule Cosmic.Planet do
  defstruct color: nil, id: nil, ships: %{}

  def add_ships(planet, {color, amount}) do
    %Cosmic.Planet{ planet |
      ships: Map.update(planet.ships,
                        color,
                        amount,
                        fn(initial) -> initial + amount end) }
  end

  def remove_ships(planet, {color, amount}) do
    %Cosmic.Planet{ planet |
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
end
