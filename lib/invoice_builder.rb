require_relative 'invoice'

class InvoiceGenerator
  def initialize(data_loader, receipt)
    @data_loader = data_loader
    @receipt = receipt
  end

  def process
    invoice = Invoice.new

    @data_loader.load_items
    @data_loader.items.each do |item|
      invoice.add_item(item)
    end

    @receipt.print(invoice)
  end
end
