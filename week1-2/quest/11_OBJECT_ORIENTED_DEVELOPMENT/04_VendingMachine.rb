class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
  end
  
  def press_button(item)
    if @total_amount.nil?
      # 何もしない
    elsif item.price > @total_amount
      # 何もしない
    else
      @total_amount = @total_amount - item.price
      item.name
    end
  end
  
  def deposit_coin(amount)
    if amount == 100
      # @total_amountがnilの場合はamountを初期値設定、それ以外はamountを加算代入
      @total_amount.nil? ? @total_amount = amount : @total_amount += amount
    end
  end
  
  private
  
  def press_manufacturer_name
    @manufacturer_name
  end
end

class Item
  def initialize(name)
    items = {
      cider: 100,
      cola: 150
    }
    
    @name = name
    @price = items[name.to_sym]
  end
  
  def name
    @name
  end
  
  def price
    @price
  end
end

cola = Item.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
