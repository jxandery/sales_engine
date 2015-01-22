require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item'

class ItemTest < Minitest::Test
  attr_reader :item

  def setup
    @item = Item.new({:id => 1, :name => "Item Qui Esse"})

  end

  def test_item_exists
    assert item
  end

  def test_item_holds_data
    assert_equal 1, item.id
  end

  def test_item_hold_name_when_initialized
    assert_equal "Item Qui Esse", item.name
  end

  def test_item_recieves_multiple_lines_of_data_in_a_hash
    assert_equal "Item Qui Esse", item.name
    assert_equal 1, item.id
  end
end
