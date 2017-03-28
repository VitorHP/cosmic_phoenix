defmodule Cosmic.DeckTest do
  use ExUnit.Case
  alias Cosmic.Deck
  alias Cosmic.Card

  test "deck has right attributes" do
    assert [] == struct(Deck, %{cards: []}).cards
  end

  describe "#new" do
    test "builds up a cosmic deck" do
      assert 72 == Enum.count(Deck.new(:cosmic).cards)
    end
  end
end

