require_relative 'item'
require 'csv'

class ItemParser
  attr_reader :items

  def parse
    file = CSV.open("./data/items.csv", headers: true, header_converters: :symbol)
    @items = file.map do |row|
      Item.new(row)
    end
  end
end
