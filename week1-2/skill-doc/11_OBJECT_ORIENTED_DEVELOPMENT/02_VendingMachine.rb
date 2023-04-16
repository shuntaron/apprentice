class VendingMachine
  def initialize(manufacturer_name)
    @name = manufacturer_name
  end
  
  def press_button
    "cider"
  end
  
  def press_manufacturer_name
    @name
  end
end

vending_machine = VendingMachine.new('サントリー')
puts vending_machine.press_manufacturer_name
