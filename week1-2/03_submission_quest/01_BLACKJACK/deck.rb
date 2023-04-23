require_relative "card"

class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::NUMBERS.each do |number|
        @cards << Card.new(suit, number)
      end
    end
    @cards.shuffle!
  end
end
