require_relative 'base'

module TaxCalculator
  class Imported < Base
    def initialize
      super
      @tax_rate = 0.05
    end

    protected

    def calculate_tax(unit_price)
      unit_price * @tax_rate
    end
  end
end
