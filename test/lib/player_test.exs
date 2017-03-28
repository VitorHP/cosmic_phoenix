defmodule Cosmic.PlayerTest do
  use ExUnit.Case
  alias Cosmic.Player
  alias Cosmic.Planet

  test "#new" do
    assert %Player{ color: "blue", planets: [
        %Planet{ color: "blue", ships: %{ "blue" => 2 }},
        %Planet{ color: "blue", ships: %{ "blue" => 2 }},
        %Planet{ color: "blue", ships: %{ "blue" => 2 }},
        %Planet{ color: "blue", ships: %{ "blue" => 2 }},
        %Planet{ color: "blue", ships: %{ "blue" => 2 }}
      ]} == Player.new("blue")
  end

end
