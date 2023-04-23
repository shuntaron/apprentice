class Card
  SUITS = %w(ハート スペード クラブ ダイヤ).freeze
  NUMBERS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  
  attr_reader :suit, :number
  
  def initialize(suit, number)
    @suit = suit
    @number = number
  end
  
  def score
    return @number.to_i if @number.to_i > 0

    case @number
    when "J" then 10
    when "Q" then 10
    when "K" then 10
    when "A" then 11
    end
  end
  
  def to_s
    "#{@suit}の#{@number}"
  end
end
