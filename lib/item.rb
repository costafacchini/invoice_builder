class Item
  attr_accessor :quantity, :name, :unit_price

  def initialize(quantity, name, unit_price)
    @name = name
    @quantity = quantity
    @unit_price = unit_price
  end
end
