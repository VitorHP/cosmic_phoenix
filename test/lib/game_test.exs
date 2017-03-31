defmodule Cosmic.GameTest do
  use ExUnit.Case
  alias Cosmic.Game
  alias Cosmic.Player
  alias Cosmic.Planet
  alias Cosmic.Card

  describe "new" do
    test "has a destiny deck" do
      assert nil != Game.new().destiny_deck
    end

    test "has a cosmic deck" do
      assert nil != Game.new().cosmic_deck
    end

    test "has a tech deck" do
      assert nil != Game.new().tech_deck
    end
  end

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

  test "deal_cosmic_cards" do
    assert %Game{
      cosmic_deck: [],
      players: [
        %Player{
          color: "blue",
          cosmic_cards: [
            %Card{id: 8},
            %Card{id: 7},
            %Card{id: 6},
            %Card{id: 5},
            %Card{id: 4},
            %Card{id: 3},
            %Card{id: 2},
            %Card{id: 1}
          ]
        }
      ]} ==
      Game.deal_cosmic_cards(%Game{
        cosmic_deck: [
          %Card{id: 1},
          %Card{id: 2},
          %Card{id: 3},
          %Card{id: 4},
          %Card{id: 5},
          %Card{id: 6},
          %Card{id: 7},
          %Card{id: 8}
        ],
        players: [%Player{ color: "blue"}]
      })
  end

end
