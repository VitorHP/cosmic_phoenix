defmodule Cosmic.PlanetTest do
  use ExUnit.Case
  alias Cosmic.Planet

  test "planet has right attributes" do
    assert 'blue' == struct(Planet, %{color: 'blue'}).color
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

  describe "#remove_ships" do
    test "from existing color" do
      assert %Planet{ ships: %{ "blue" => 0 } } == Planet.remove_ships(%Planet{ ships: %{ "blue" => 2 }}, { "blue", 2 })
    end

    test "removing more ships than there are ships to remove" do
      assert %Planet{ ships: %{ "blue" => 2 } } == Planet.remove_ships(%Planet{ ships: %{ "blue" => 2 }}, { "blue", 3 })
    end
  end

  describe "#has_control?" do
    test "of own planets where it has ships" do
      assert true == Planet.has_control?(%Planet{ color: "blue", ships: %{ "blue" => 2 }}, "blue")
    end

    test "of own planets where it has no ships" do
      assert false == Planet.has_control?(%Planet{ color: "blue", ships: %{ "blue" => 0 }}, "blue")
    end

    test "of other planets where it has ships" do
      assert false == Planet.has_control?(%Planet{ color: "red", ships: %{ "blue" => 2 }}, "blue")
    end

    test "of other planets where it has no ships" do
      assert false == Planet.has_control?(%Planet{ color: "red", ships: %{ "red" => 2 }}, "blue")
    end
  end

  describe "#has_colony?" do
    test "in own planet" do
      assert false == Planet.has_colony?(%Planet{ color: "blue", ships: %{ "blue" => 2 }}, "blue")
    end

    test "in other planets where it has ships" do
      assert true == Planet.has_colony?(%Planet{ color: "red", ships: %{ "blue" => 2 }}, "blue")
    end

    test "in other planets where it has no ships" do
      assert false == Planet.has_colony?(%Planet{ color: "red", ships: %{ "red" => 2 }}, "blue")
    end
  end
end
