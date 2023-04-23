class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def hand(cards)
    score = 0
    
    cards.map do |card|
      score += card.score
    end
    
    return score
  end
  
end
