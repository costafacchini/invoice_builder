require_relative 'tax_calculator/imported'
require_relative 'tax_calculator/not_taxed'
require_relative 'tax_calculator/taxed'
require_relative 'item'

module Invoices
  class ItemBuilder
    def self.build_new_invoice_item(item)
      invoice_item = Invoices::Item.new(item.name, item.quantity, item.unit_price)
      invoice_item.add_tax_calculator(::TaxCalculator::Imported.new) if item.imported?
      invoice_item.add_tax_calculator(item.taxed? ? ::TaxCalculator::Taxed.new : ::TaxCalculator::NotTaxed.new)
      invoice_item
    end
  end
end
