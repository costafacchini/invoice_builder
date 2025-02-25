require_relative '../items/item_parser'
require_relative 'base'

module DataLoader
  class TextFile < Base
    attr_reader :items

    def initialize(source)
      super()
      @source = source
    end

    def load_items
      @items = File.readlines(@source).map { |line| ItemParser.parse(line) }
    end
  end
end
