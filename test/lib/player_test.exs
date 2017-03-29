defmodule Cosmic.PlayerTest do
  use ExUnit.Case
  alias Cosmic.Player
  alias Cosmic.Planet
  alias Cosmic.Card

  test "#new" do
    assert %Player{ color: "blue", planets: [
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }},
        %Planet{ color: "blue", ships: %{ "blue" => 4 }}
      ]} == Player.new("blue")
  end

  test "#deal_cosmic_card" do
    assert %Player{ cosmic_cards: [%Card{ type: :attack }] } ==
      Player.deal_cosmic_card(%Player{}, %Card{ type: :attack })
  end

end
