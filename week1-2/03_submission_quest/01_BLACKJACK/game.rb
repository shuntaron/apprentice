require_relative "deck"
require_relative "player"

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new("あなた")
    @dealer = Player.new("ディーラー")
    @player_cards = []
    @dealer_cards = []
  end
  
  def start
    puts "ブラックジャックを開始します"
    # プレイヤーのドロー
    @player_cards << @deck.draw
    @player_cards << @deck.draw
    @player_cards.flatten
    # ディーラーのドロー
    @dealer_cards << @deck.draw
    @dealer_cards << @deck.draw
    @dealer_cards.flatten
    
    @player_cards.each_with_index do |player_card, i|
      puts "#{@player.name}の引いたカードは#{player_card.to_s}です"
    end
    
    @dealer_cards.each_with_index do |dealer_card, i|
      puts "#{@dealer.name}の引いたカードは#{dealer_card.to_s}です"
    end
    
  end
end
