class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
  end
  
  def press_button
    if @total_amount.nil?
      # 何もしない
    elsif (@total_amount % 100 == 0) || (@total_amount >= 100)
      @total_amount = @total_amount - 100
      'cider'
    end
  end
  
  def deposit_coin(amount)
    if amount == 100
      @total_amount.nil? ? @total_amount = amount : @total_amount += amount
    end
  end
  
  private
  
  def press_manufacturer_name
    @manufacturer_name
  end
  
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_button

vending_machine.deposit_coin(150)
puts vending_machine.press_button

vending_machine.deposit_coin(100)
puts vending_machine.press_button

puts vending_machine.press_manufacturer_name
