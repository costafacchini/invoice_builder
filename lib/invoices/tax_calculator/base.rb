module TaxCalculator
  class Base
    def taxes(item_total)
      tax = calculate_tax(item_total)
      round_tax(tax)
    end

    private

    def round_tax(tax)
      (tax * 20).ceil / 20.0
    end

    protected

    def calculate_tax(item_total); end
  end
end
