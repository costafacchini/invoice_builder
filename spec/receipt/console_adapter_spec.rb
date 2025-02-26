require 'spec_helper'
require 'receipt/console_adapter'
require 'items/item_parser'
require 'invoice'

RSpec.describe Receipt::ConsoleAdapter do
  describe '#print' do
    it 'prints invoice' do
      invoice = Invoice.new
      invoice.add_item(ItemParser.parse('2 book at 12.49'))
      invoice.add_item(ItemParser.parse('1 imported box of chocolates at 10.00'))
      invoice.add_item(ItemParser.parse('1 imported bottle of perfume at 27.99'))
      invoice.add_item(ItemParser.parse('1 bottle of perfume at 18.99'))
      invoice.add_item(ItemParser.parse('1 packet of headache pills at 9.75'))

      sample = "2 book: 24.98\n" \
               "1 imported box of chocolates: 10.50\n" \
               "1 imported bottle of perfume: 32.19\n" \
               "1 bottle of perfume: 20.89\n" \
               "1 packet of headache pills: 9.75\n" \
               "Sales Taxes: 6.6\n" \
               "Total: 98.31\n"

      printer = described_class.new

      expect { printer.print(invoice) }.to output(sample).to_stdout
    end
  end
end
