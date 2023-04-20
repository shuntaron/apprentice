class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
  end
  
  def press_button(item)
    # 入金合計金額の格納変数がnilの場合
    if @total_amount.nil?
      # 何もしない
    # 入金合計金額より商品の金額が高い場合
    elsif item.price > @total_amount
      # 何もしない
    # それ以外
    else
      # 注文商品のクラスがCupCoffeeの場合
      if item.class == CupCoffee
        # カップ数がnilの場合
        if @cups_count.nil?
          # 処理中断
          return
        # カップ数が0より大きい場合
        elsif @cups_count > 0
          # カップ数を1マイナス
          @cups_count -= 1
          # 入金合計金額から商品の金額をマイナス
          @total_amount = @total_amount - item.price
          "#{item.temperature} #{item.name}"
        # それ以外
        else
          # 処理中断
          return
        end
      # それ以外
      else
      # 入金合計金額から商品の金額をマイナス
      @total_amount = @total_amount - item.price
      item.name
      end
    end
  end
  
  def deposit_coin(amount)
    if amount == 100
      # @total_amountがnilの場合はamountを初期値設定、それ以外はamountを加算代入
      @total_amount.nil? ? @total_amount = amount : @total_amount += amount
    end
  end
  
  def add_cup(cups_count)
    max_cups = 100
    
    # 引数が100より小さい場合
    if cups_count < max_cups
      # カップ数がnilの場合
      if @cups_count.nil? 
        # 引数をカップ数へ設定
        @cups_count = cups_count
      # カップ数の格納変数と引数の合計が100を超える場合
      elsif @cups_count + cups_count > max_cups
        @cups_count = max_cups
      # それ以外
      else
        @cups_count += cups_count
      end
    # 引数が100以上の場合
    else
      @cups_count = max_cups
    end
  end
  
  private
  
  def press_manufacturer_name
    @manufacturer_name
  end
end

class Item
  attr_reader :name, :price, :temperature
  
  def initialize(name)
    items = {
      cider: 100,
      cola: 150
    }
    
    @name = name
    @price = items[name.to_sym]
  end
  
end

class Drink < Item
end

class CupCoffee < Item
  def initialize(temperature)
    @name = 'cup coffee'
    @price = 100
    @temperature = temperature
  end
end
  
hot_cup_coffee = CupCoffee.new('hot')
cider = Drink.new('cider')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)
