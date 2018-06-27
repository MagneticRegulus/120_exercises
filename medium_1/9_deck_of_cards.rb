class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards

  def initialize
    reset_deck
  end

  def draw
    reset_deck if cards.empty?
    remove_card
  end

  private

  def reset_deck
    @cards = []
    SUITS.each do |suit|
      RANKS.each {|rank| cards << Card.new(rank, suit) }
    end
    cards.shuffle!
  end

  def remove_card
    cards.pop
  end
end

class Card
  include Comparable

  RANKINGS = {'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14}

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ranking
    RANKINGS.fetch(rank, rank)
  end

  def <=>(other_card)
    ranking <=> other_card.ranking
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
