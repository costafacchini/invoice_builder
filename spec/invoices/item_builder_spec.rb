require 'spec_helper'
require 'invoices/item_builder'
require 'invoices/item'
require 'items/item_parser'

RSpec.describe Invoices::ItemBuilder do
  describe '#build_new_invoice_item' do
    it 'builds a new Item not taxed' do
      allow(TaxCalculator::NotTaxed).to receive(:new)

      line = ItemParser.parse('2 book at 47.50')
      item = described_class.build_new_invoice_item(line)

      expect(item).to be_a(Invoices::Item)
      expect(TaxCalculator::NotTaxed).to have_received(:new)
    end

    it 'builds a new Item taxed' do
      allow(TaxCalculator::Taxed).to receive(:new)

      line = ItemParser.parse('2 music CD at 47.50')
      item = described_class.build_new_invoice_item(line)

      expect(item).to be_a(Invoices::Item)
      expect(TaxCalculator::Taxed).to have_received(:new)
    end

    it 'builds a new Item imported' do
      allow(TaxCalculator::Imported).to receive(:new)

      line = ItemParser.parse('2 imported music CD at 47.50')
      item = described_class.build_new_invoice_item(line)

      expect(item).to be_a(Invoices::Item)
      expect(TaxCalculator::Imported).to have_received(:new)
    end
  end
end
