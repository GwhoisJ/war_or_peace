class Player
  attr_reader :deck,
              :name


  def initialize(name, deck)
    @name   = name
    @deck   = deck

  end

  def has_lost?
    lost = false
    if deck.cards.count == 0
      lost = true
    end
    lost
  end
end
