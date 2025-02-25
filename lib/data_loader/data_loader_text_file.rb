require 'item_parser'
require_relative 'data_loader_base'

class DataLoaderTextFile < DataLoaderBase
  attr_reader :items

  def initialize(source)
    super()
    @source = source
  end

  def load_items
    @items = File.readlines(@source).map { |line| ItemParser.parse(line) }
  end
end
