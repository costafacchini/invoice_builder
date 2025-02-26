require_relative 'base'

module TaxCalculator
  class Taxed < Base
    def initialize
      super
      @tax_rate = 0.10
    end

    protected

    def calculate_tax(unit_price)
      unit_price * @tax_rate
    end
  end
end
