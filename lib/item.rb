class Item
  NOT_TAXED = %i[chocolate pills book].freeze

  attr_accessor :quantity, :name, :unit_price

  def initialize(quantity, name, unit_price)
    @name = name
    @quantity = quantity
    @unit_price = unit_price
  end

  def taxed?
    NOT_TAXED.find { |type| name.match(type.to_s) } ? false : true
  end

  def imported?
    name.include?('imported')
  end
end
