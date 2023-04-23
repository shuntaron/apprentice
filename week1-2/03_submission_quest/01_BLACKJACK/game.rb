require_relative "deck"

class Game
  def initialize
    @deck = Deck.new
  end
  
  def start
    puts "ブラックジャックを開始します"
    @deck.cards.each do |card|
      p card
    end
  end
end
