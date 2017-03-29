defmodule Cosmic.DeckTest do
  use ExUnit.Case
  alias Cosmic.Deck
  alias Cosmic.Card

  describe "#new" do
    test "builds up a deck" do
      assert 72 == Enum.count(Deck.new(:cosmic))
      assert 20 == Enum.count(Deck.new(:tech))
      assert 20 == Enum.count(Deck.new(:destiny))
    end
  end
end

