module Invoices
  class Item
    attr_accessor :name, :quantity

    def initialize(name, quantity, unit_price)
      @name = name
      @quantity = quantity
      @unit_price = unit_price
      @taxes_calculator = []
    end

    def add_tax_calculator(tax_calculator)
      @taxes_calculator << tax_calculator
    end

    def total
      @total ||= total_without_taxes + taxes
    end

    def taxes
      @taxes_calculator.reduce(0) do |sum, tax_calculator|
        sum + (tax_calculator.taxes(@unit_price) * quantity)
      end
    end

    private

    def total_without_taxes
      @quantity * @unit_price
    end
  end
end
