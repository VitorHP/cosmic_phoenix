defmodule Cosmic.CardTest do
  use ExUnit.Case
  alias Cosmic.Card

  test "card has right attributes" do
    assert 'blue' == struct(Card, %{title: 'blue'}).title
    assert true == struct(Card, %{flipped: true}).flipped
    assert "placeholder" == struct(Card, %{ text: "placeholder"}).text
    assert 1 == struct(Card, %{id: 1}).id
  end
end

