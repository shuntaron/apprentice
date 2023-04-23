class Card
  SUITS = %w(ハート スペード クラブ ダイヤ).freeze
  NUMBERS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  
  attr_reader :suit, :number
  
  def initialize(suit, number)
    @suit = suit
    @number = number
  end
  
end