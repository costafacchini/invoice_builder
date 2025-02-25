require 'spec_helper'
require 'item_parser'

RSpec.describe ItemParser do
  describe '.parse' do
    it 'parses a line of text into an Item object' do
      line = '2 imported bottle of perfume at 47.50'
      item = described_class.parse(line)

      expect(item).to be_a(Item)
      expect(item.quantity).to eq(2)
      expect(item.name).to eq('imported bottle of perfume')
      expect(item.unit_price).to eq(47.50)
    end

    it 'raises an error for an invalid line of text' do
      line = 'invalid line'
      expect { described_class.parse(line) }.to raise_error(ItemParserError, 'Invalid format for line: invalid line')
    end
  end
end
