defmodule Cosmic.GameTest do
  use ExUnit.Case
  alias Cosmic.Game
  alias Cosmic.Player
  alias Cosmic.Planet

  test "add_player" do
    assert %Game{ players: [Player.new("blue")] } == Game.add_player(%Game{}, "blue")
  end

  describe "score" do
    assert %{ "red" => 3, "green" => 2, "blue" => 1 } == Game.score(%Game{
      players: [
        %Player{ color: "blue", planets: [
          %Planet{ color: "blue", ships: %{ "blue" => 2 }},
          %Planet{ color: "blue", ships: %{ "blue" => 2 }},
          %Planet{ color: "blue", ships: %{ "blue" => 2, "red" => 2 }},
          %Planet{ color: "blue", ships: %{ "blue" => 2, "red" => 1 }},
          %Planet{ color: "blue", ships: %{ "blue" => 2, "red" => 1 }}
        ]},
        %Player{ color: "red", planets: [
          %Planet{ color: "red", ships: %{ "red" => 2, "green" => 2 }},
          %Planet{ color: "red", ships: %{ "red" => 2 }},
          %Planet{ color: "red", ships: %{ "red" => 2 }},
          %Planet{ color: "red", ships: %{ "red" => 2, "blue" => 2, "green" => 1 }},
          %Planet{ color: "red", ships: %{ "red" => 2 }}
        ]}
      ]
    })
  end

end
