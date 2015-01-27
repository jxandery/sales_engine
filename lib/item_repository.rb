require_relative 'item_parser'

class ItemRepository
  attr_reader :items,
              :engine,
              :file

  def initialize(filename, engine)
    @file = filename
    @engine = engine
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end
  
  def parse
    parser = ItemParser.new(file, engine)
    @items = parser.parse
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_name(input)
    items.detect {|item| item.name == input}
  end

  def find_by_id(input)
    items.detect {|item| item.id == input.to_i}
  end

  def find_by_description(input)
    items.detect {|item| item.description == input}
  end

  def find_by_unit(number)
    items.detect {|item| item.unit_price == number.to_i}
  end

  def find_by_merchant_id(number)
    items.detect {|item| item.merchant_id == number.to_i}
  end

  def find_by_created_at(date)
    items.detect {|item| item.created_at == date}
  end

  def find_by_updated_at(date)
    items.detect {|item| item.created_at == date}
  end

  def find_all_by_name(input)
    items.select {|item| item.name == input}
  end

  def find_all_by_id(input)
    items.select {|item| item.id == input.to_i}
  end

  def find_all_by_description(input)
    items.select {|item| item.description == input}
  end

  def find_all_by_unit(number)
    items.select {|item| item.unit_price == number.to_i}
  end

  def find_all_by_merchant_id(number)
    items.select {|item| item.merchant_id == number.to_i}
  end

  def find_all_by_created_at(date)
    items.select {|item| item.created_at == date}
  end

  def find_all_by_updated_at(date)
    items.select {|item| item.created_at == date}
  end

end
