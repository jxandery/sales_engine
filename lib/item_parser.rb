require_relative 'item'
require 'csv'

class ItemParser
  attr_reader :items,
              :engine,
              :file

  def initialize(file, engine)
    @engine = engine
    @file = file
  end

  def parse
    read = "#{file}/items.csv"
    items_info = CSV.open(read, headers: true, header_converters: :symbol)
    # CSV is not an array but it behaves like an array and can be used as such
    @items = items_info.map do |row|
      Item.new(row, engine)
    end
  end
end
