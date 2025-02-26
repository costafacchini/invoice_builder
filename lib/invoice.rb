require_relative 'invoices/item_builder'

class Invoice
  attr_accessor :items

  def initialize
    @items = []
  end

  def taxes
    items.sum(&:taxes)
  end

  def total
    items.sum(&:total)
  end

  def add_item(item)
    @items << Invoices::ItemBuilder.build_new_invoice_item(item)
  end
end
