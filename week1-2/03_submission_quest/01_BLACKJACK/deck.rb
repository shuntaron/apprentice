class Deck
  attr_reader :deck
  
  def initialize
    @deck = []
    suits = %w(ハート スペード クラブ ダイヤ)
    numbers = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    
    suits.each do |suit|
      numbers.each do |number|
        @deck << [suit, number]
      end
    end
    @deck.shuffle!
  end
end
