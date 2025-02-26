require_relative 'base'

module TaxCalculator
  class NotTaxed < Base
    protected

    def calculate_tax(_)
      0
    end
  end
end
