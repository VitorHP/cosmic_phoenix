defmodule Cosmic.Planet do
  defstruct user_id: nil, id: nil, ships: %{}

  def add_ships(planet, {color, amount}) do
    %Cosmic.Planet{ planet | ships: Map.update(planet.ships, color, amount, fn(initial) -> initial + amount end) }
  end
end
