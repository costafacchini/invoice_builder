require 'spec_helper'
require 'invoice'
require 'items/item_parser'

RSpec.describe Invoice do
  describe '#taxes' do
    it 'is the sum of items taxes' do
      invoice = described_class.new
      invoice.add_item(ItemParser.parse('2 book at 12.49'))
      invoice.add_item(ItemParser.parse('1 imported box of chocolates at 10.00'))

      expect(invoice.taxes).to be 0.50
    end
  end

  describe '#total' do
    it 'is the sum of items total' do
      invoice = described_class.new
      invoice.add_item(ItemParser.parse('2 book at 12.50'))
      invoice.add_item(ItemParser.parse('1 imported box of chocolates at 10.00'))

      expect(invoice.total).to be 35.5
    end
  end
end
