require_relative 'base'

module Receipt
  class ConsoleAdapter < Base
    def print(invoice)
      puts "#{print_items(invoice)}#{print_footer(invoice)}"
    end

    private

    def print_items(invoice)
      invoice.items.map do |item|
        "#{item.quantity} #{item.name}: #{format('%.2f', item.total)}"
      end.join("\n")
    end

    def print_footer(invoice)
      "\nSales Taxes: #{invoice.taxes}\nTotal: #{invoice.total}\n"
    end
  end
end
