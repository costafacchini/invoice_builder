require 'spec_helper'
require 'invoices/item'

RSpec.describe Invoices::Item do
  describe '#taxes' do
    it 'is the sum of product taxes' do
      item = described_class.new('product', 2, 10.50)
      item.add_tax_calculator(instance_double('tax_calculator', calculate: 1.0))
      item.add_tax_calculator(instance_double('tax_calculator', calculate: 1.0))

      expect(item.taxes).to be 2.0
    end
  end

  describe '#total' do
    it 'is (unit_price * quantity) + taxes' do
      item = described_class.new('product', 2, 10.20)
      item.add_tax_calculator(instance_double('tax_calculator', calculate: 1.0))
      item.add_tax_calculator(instance_double('tax_calculator', calculate: 0.5))

      expect(item.total).to be 21.9
    end
  end
end
