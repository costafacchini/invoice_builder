require 'item'

class ItemParserError < StandardError; end

class ItemParser
  def self.parse(line)
    regex = /(\d+)\s+(.+)\sat\s(\d+\.\d{2})/

    raise ItemParserError, "Invalid format for line: #{line}" unless line.match(regex)

    quantity = line.match(regex)[1].to_i
    name = line.match(regex)[2]
    unit_price = line.match(regex)[3].to_f

    Item.new(quantity, name, unit_price)
  end
end
