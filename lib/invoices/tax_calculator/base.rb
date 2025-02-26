module TaxCalculator
  class Base
    def taxes(unit_price)
      tax = calculate_tax(unit_price)
      round_tax(tax)
    end

    private

    def round_tax(tax)
      (tax * 20).ceil / 20.0
    end

    protected

    def calculate_tax(unit_price); end
  end
end
