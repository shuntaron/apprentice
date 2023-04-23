require_relative "deck"
require_relative "player"

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new("あなた")
    @dealer = Player.new("ディーラー")
  end
  
  def start
    puts "ブラックジャックを開始します"
    puts "#{@player.name}の引いたカードは#{@deck.draw}です"
    puts "#{@player.name}の引いたカードは#{@deck.draw}です"
    puts "#{@dealer.name}の引いたカードは#{@deck.draw}です"
    puts "#{@dealer.name}の引いたカードは#{@deck.draw}です"
  end
end
