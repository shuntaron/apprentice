class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def hand(cards)
    score = 0
    numbers = []
    
    # 手札の数字を配列に格納
    cards.map do |card|
      numbers << card.number
    end
    
    # 手札の得点を計算
    cards.map do |card|
      score += card.score
    end
    
    # 手札の得点が21より大きく、手札にAが存在する場合、21以下になるまでAの得点を「1」へ変更する
    if score > 21 && numbers.include?("A")
      numbers.count("A").times do
        if score > 21
          score -= 10
        else
          break
        end
      end
    end
    
    return score
  end
  
end
