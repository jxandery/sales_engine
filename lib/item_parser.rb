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
    items = CSV.open("./#{file}/items.csv", headers: true, header_converters: :symbol)
    @items = items.map do |row|
      Item.new(row, engine)
    end
  end
end
