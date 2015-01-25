require_relative 'item'
require 'csv'

class ItemParser
  attr_reader :items,
              :engine,
              :file

  def initialize(file, engine)
    @engine = engine
    @file = data
  end

  def parse
    file = CSV.open("./#{data}/items.csv", headers: true, header_converters: :symbol)
    @items = file.map do |row|
      Item.new(row, engine)
    end
  end
end
