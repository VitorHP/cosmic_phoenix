defmodule Cosmic.Player do
  defstruct color: nil, planets: []
  alias Cosmic.Planet

  def new(color) do
    %__MODULE__{
      color: color,
      planets: 1..5 |> Enum.map(fn(_) -> Planet.new(color, 4) end)
    }
  end
end
