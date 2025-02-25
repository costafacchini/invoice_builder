module DataLoader
  class Error < StandardError; end

  class Base
    attr_accessor :items

    def initialize
      @items = []
    end

    def load_data; end
  end
end
