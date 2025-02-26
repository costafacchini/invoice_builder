require 'spec_helper'
require 'invoices/tax_calculator/taxed'

RSpec.describe TaxCalculator::Taxed do
  describe '#taxes' do
    it 'is item total * 0.10' do
      calculator = described_class.new

      expect(calculator.taxes(100)).to eq(10.0)
      expect(calculator.taxes(100.4)).to eq(10.05)
      expect(calculator.taxes(101.1)).to eq(10.15)
      expect(calculator.taxes(101.5)).to eq(10.15)
      expect(calculator.taxes(0.4)).to eq(0.05)
      expect(calculator.taxes(0.6)).to eq(0.1)
    end
  end
end
