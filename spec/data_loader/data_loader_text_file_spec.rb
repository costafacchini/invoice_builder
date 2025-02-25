require 'spec_helper'
require 'data_loader/data_loader_text_file'

RSpec.describe DataLoaderTextFile do
  describe '#load_items' do
    context 'when input file is valid' do
      it 'loads items' do
        data_loader = described_class.new(file_fixture('input.txt'))
        data_loader.load_items

        expect(data_loader.items.size).to eq(9)
        expect(data_loader.items[0].quantity).to eq(2)
        expect(data_loader.items[0].name).to eq('book')
        expect(data_loader.items[0].unit_price).to eq(12.49)
        expect(data_loader.items[8].quantity).to eq(3)
        expect(data_loader.items[8].name).to eq('imported boxes of chocolates')
        expect(data_loader.items[8].unit_price).to eq(11.25)
      end
    end
  end
end
