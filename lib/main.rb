require_relative 'data_loader/text_file'
require_relative 'invoice_builder'
require_relative 'receipt/console_adapter'

class Main
  if ARGV.empty?
    puts 'How to use: ruby lib/main.rb spec/fixtures/input.txt'
  else
    source = ARGV[0]
    data_loader = DataLoader::TextFile.new(source)
    receipt_adapter = Receipt::ConsoleAdapter.new
    invoice_builder = InvoiceGenerator.new(data_loader, receipt_adapter)
    invoice_builder.process
  end
end
