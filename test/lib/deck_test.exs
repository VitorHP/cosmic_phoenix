defmodule Cosmic.DeckTest do
  use ExUnit.Case
  alias Cosmic.Deck
  alias Cosmic.Card

  test "deck has right attributes" do
    assert [] == struct(Deck, %{cards: []}).cards
  end

  describe "#new" do
    test "builds up a deck" do
      assert 72 == Enum.count(Deck.new(:cosmic).cards)
      assert 20 == Enum.count(Deck.new(:tech).cards)
      assert 20 == Enum.count(Deck.new(:destiny).cards)
    end
  end

  describe "#buy" do
    test "from an empty deck" do
      assert { nil, %Deck{} }== Deck.buy(struct(Deck, %{}))
    end

    test "from a one card deck" do
      assert { %Card{ id: 1 }, %Deck{ cards: [] } } ==
        Deck.buy(%Deck{ cards: [%Card{ id: 1 }] })
    end

    test "from a bigger deck" do
      assert {
        %Card{ id: 1 },
        %Deck{ cards: [ %Card{ id: 2 }, %Card{ id: 3 } ] }
      } ==
        Deck.buy(
          %Deck{ cards: [
            %Card{ id: 1 },
            %Card{ id: 2 },
            %Card{ id: 3 }
          ]}
        )
    end
  end
end

