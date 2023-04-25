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
    puts "ブラックジャックを開始します。"
    
    # プレイヤーのドロー
    @player_cards << @deck.draw
    @player_cards << @deck.draw
    @player_cards.flatten
    
    # ディーラーのドロー
    @dealer_cards << @deck.draw
    @dealer_cards << @deck.draw
    @dealer_cards.flatten
    
    # プレイヤーのカード表示
    puts "#{@player.name}の引いたカードは#{@player_cards[0].to_s}です。"
    puts "#{@player.name}の引いたカードは#{@player_cards[1].to_s}です。"
    
    # ディーラーのカード表示
    puts "#{@dealer.name}の引いたカードは#{@dealer_cards[0].to_s}です。"
    puts "#{@dealer.name}の引いた2枚目のカードはわかりません。"
    
    # プレイヤーのターン
    # 得点が21以上になるまで引き続けることができる
    while @player.hand(@player_cards) < 21 do
      puts "#{@player.name}の現在の得点は#{@player.hand(@player_cards)}です。カードを引きますか？（Y/N）"
      choice = gets.chomp.to_s
      if choice == "Y"
        @player_cards << @deck.draw
        @player_cards.flatten
        puts "#{@player.name}の引いたカードは#{@player_cards[-1].to_s}です"
      elsif choice == "N"
        break
      else
        puts "#{@player.name}の現在の得点は#{@player.hand(@player_cards)}です。カードを引きますか？（Y/N）"
      end
    end
    
    # ディーラーの2枚目のカード表示
    puts "#{@dealer.name}の引いた2枚目のカードは#{@dealer_cards[1].to_s}でした。"
    
    # ディーラーの現在の得点表示
    puts "#{@dealer.name}の現在の得点は#{@dealer.hand(@dealer_cards)}です。"
    
    # ディーラーのターン
    # 得点が17以上になるまで引き続ける
    while @dealer.hand(@dealer_cards) < 17 do
      @dealer_cards << @deck.draw
      @dealer_cards.flatten
    end
    
    # プレイヤーの得点表示
    puts "#{@player.name}の得点は#{@player.hand(@player_cards)}です。"
    
    # 勝負の判定
    if @player.hand(@player_cards) > 21
      puts "あなたの負けです！"
    elsif @dealer.hand(@dealer_cards) > 21
      puts "あなたの勝ちです！"
    elsif (21 - @player.hand(@player_cards).to_i).abs < (21 - @dealer.hand(@dealer_cards).to_i).abs
      puts "あなたの勝ちです！"
    elsif (21 - @player.hand(@player_cards).to_i).abs == (21 - @dealer.hand(@dealer_cards).to_i).abs
      puts "引き分けです！"
    else
      puts "あなたの負けです！"
    end
    
    puts "ブラックジャックを終了します。"
  end
end
