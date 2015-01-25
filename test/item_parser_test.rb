require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item_parser'

class ItemParserTest < Minitest::Test
  attr_reader :item_parser

  def setup
    @item_parser = ItemParser.new("data",'')
  end

  def test_parser_exists
    assert item_parser
  end

  def test_parser_can_make_item
    item_parser.parse
    assert item_parser.items[0].is_a?(Item)
  end
end
