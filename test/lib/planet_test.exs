defmodule Cosmic.PlanetTest do
  use ExUnit.Case
  alias Cosmic.Planet

  test "planet has right attributes" do
    assert 1 == struct(Planet, %{user_id: 1}).user_id
    assert 2 == struct(Planet, %{id: 2}).id
    assert %{} == struct(Planet, %{}).ships
  end

  describe "#add_ships" do
    test "adding ships" do
      assert %Planet{ ships: %{ "blue" => 2 } } == Planet.add_ships(%Planet{}, { "blue", 2 })
    end

    test "adding ships to existing color" do
      assert %Planet{ ships: %{ "blue" => 3 } } == Planet.add_ships(%Planet{ships: %{ "blue" => 1 }}, { "blue", 2 })
    end

    test "adding ships to another color" do
      assert %Planet{ ships: %{ "blue" => 1, "red" => 2 } } == Planet.add_ships(%Planet{ships: %{ "blue" => 1 }}, { "red", 2 })
    end
  end
end
