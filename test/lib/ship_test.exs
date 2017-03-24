defmodule Cosmic.ShipTest do
  use ExUnit.Case
  alias Cosmic.Ship

  test "ship has right attributes" do
    assert 'white' == struct(Ship, %{color: 'white'}).color
  end
end
