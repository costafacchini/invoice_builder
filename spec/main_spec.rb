require 'spec_helper'
require 'main'

RSpec.describe Main do
  context 'when input file is valid' do
    it 'prints the invoice recepit to stdout' do
      stub_const('ARGV', [file_fixture('input.txt')])

      sample = "2 book: 24.98\n" \
               "1 music CD: 16.49\n" \
               "1 chocolate bar: 0.85\n" \
               "1 imported box of chocolates: 10.50\n" \
               "1 imported bottle of perfume: 54.65\n" \
               "1 imported bottle of perfume: 32.19\n" \
               "1 bottle of perfume: 20.89\n" \
               "1 packet of headache pills: 9.75\n" \
               "3 imported boxes of chocolates: 35.55\n" \
               "Sales Taxes: 17.05\n" \
               "Total: 205.85\n"

      expect { load 'main.rb' }.to output(sample).to_stdout
    end
  end

  context 'when there is no argument' do
    it 'outputs error message' do
      stub_const('ARGV', [])

      expect { load 'main.rb' }.to output("How to use: ruby lib/main.rb spec/fixtures/input.txt\n").to_stdout
    end
  end

  context 'when input file is invalid' do
    it 'raises the corresponding error message' do
      stub_const('ARGV', [file_fixture('invalid-input.txt')])

      expect { load 'main.rb' }.to raise_error('Invalid format for line: 2 invalid input')
    end
  end
end
