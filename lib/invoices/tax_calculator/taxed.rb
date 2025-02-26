require_relative 'base'

module TaxCalculator
  class Taxed < Base
    def initialize
      super
      @tax_rate = 0.10
    end

    protected

    def calculate_tax(item_total)
      item_total * @tax_rate
    end
  end
end
