require "rspec"
require "./lib/turn"

describe Turn do
  describe "#initialize" do
    it "is an instance of turn" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn).to be_a Turn
    end

    it "has players" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.player1.name).to eq "Megan"
      expect(turn.player1.deck).to eq deck1

      expect(turn.player2.name).to eq "Aurora"
      expect(turn.player2.deck).to eq deck2
    end
  end

  describe "#turn" do
    it "returns turn type :basic" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq :basic
    end

    it "returns turn type :war" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq :war
    end

    it "returns turn type :mutually_assured_destruction" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.type).to eq :mutually_assured_destruction
    end
  end

  describe "#winner" do
    it "declares the winner for basic turns" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq player1
    end

    it "declares the winner for war turns" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq player2
    end

    it "declares no winner" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      expect(turn.winner).to include "No Winner"
    end
  end

  describe "#pile_cards" do
    it "adds top card for basic" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      test = [card1, card3]

      turn.pile_cards

      expect(turn.spoils_of_war).to be_a Array
      expect(turn.spoils_of_war.count).to eq 2
      expect(turn.spoils_of_war).to eq test
    end

    it "adds top three cards for war" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      test = [card1, card4, card2, card3, card5, card6]

      turn.pile_cards

      expect(turn.spoils_of_war).to be_a Array
      expect(turn.spoils_of_war.count).to eq 6
      expect(turn.spoils_of_war).to eq test
    end

    it "removes top 3 cards for mutually_assured_destruction" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, '8', 8)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      test1 = Deck.new([card8])
      test2 = Deck.new([card7])

      turn.pile_cards

      expect(turn.player1.deck.cards).to eq test1.cards
      expect(turn.player2.deck.cards).to eq test2.cards

      expect(turn.spoils_of_war).to be_a Array
      expect(turn.spoils_of_war).to eq []
    end
  end

  describe "#award_spoils" do
    it "adds cards to winner in basic" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      test1 = Deck.new([card2, card5, card8, card1, card3])
      test2 = Deck.new([card4, card6, card7])

      winner = turn.winner

      turn.pile_cards

      turn.award_spoils(winner)

      expect(player1.deck.cards).to be_a Array
      expect(player1.deck.cards.count).to eq 5
      expect(player1.deck.cards).to eq test1.cards

      expect(player2.deck.cards).to be_a Array
      expect(player2.deck.cards.count).to eq 3
      expect(player2.deck.cards).to eq test2.cards
    end

    it "adds cars to winner in war" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])

      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)

      turn = Turn.new(player1, player2)

      test1 = Deck.new([card8])
      test2 = Deck.new([card7, card1, card4, card2, card3, card5, card6])

      winner = turn.winner

      turn.pile_cards

      turn.award_spoils(winner)

      expect(player1.deck.cards).to be_a Array
      expect(player1.deck.cards.count).to eq 1
      expect(player1.deck.cards).to eq test1.cards

      expect(player2.deck.cards).to be_a Array
      expect(player2.deck.cards.count).to eq 7
      expect(player2.deck.cards).to eq test2.cards
    end
  end
end
