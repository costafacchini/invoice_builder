require 'spec_helper'
require 'items/item'

RSpec.describe Item do
  describe '#imported' do
    it 'is true when it has imported in the name' do
      item = described_class.new(1, 'john doe imported bottle of perfume', 47.50)
      expect(item.imported?).to be true
    end

    it 'is false when there is no imported in the name' do
      item = described_class.new(1, 'bottle of perfume', 47.50)
      expect(item.imported?).to be false
    end
  end

  describe '#taxed?' do
    it 'is false when the name contains book' do
      item = described_class.new(1, 'book', 47.50)
      expect(item.taxed?).to be false
    end

    it 'is false when the name contains chocolate' do
      item = described_class.new(1, 'chocolate', 47.50)
      expect(item.taxed?).to be false
    end

    it 'is false when the name contains pills' do
      item = described_class.new(1, 'pills', 47.50)
      expect(item.taxed?).to be false
    end

    it 'is true when the name does not contain special words' do
      item = described_class.new(1, 'music CD', 47.50)
      expect(item.taxed?).to be true

      item.name = 'bottle of perfume'
      expect(item.taxed?).to be true
    end
  end
end
