require 'spec_helper'
require 'invoices/tax_calculator/not_taxed'

RSpec.describe TaxCalculator::NotTaxed do
  describe '#taxes' do
    it 'is zero' do
      calculator = described_class.new
      expect(calculator.taxes(99)).to eq(0)
    end
  end
end
