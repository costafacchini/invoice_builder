class DataLoaderBase
  attr_accessor :items

  def initialize
    @items = []
  end

  def load_data; end
end
