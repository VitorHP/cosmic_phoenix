defmodule Cosmic.PlayerTest do
  use ExUnit.Case
  alias Cosmic.Player
  alias Cosmic.Planet

  test "#new" do
    assert %Player{ color: "blue", planets: [
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }}
      ]} == Player.new("blue")
  end

end
