require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item'
require_relative '../lib/merchant'

class ItemTest < Minitest::Test
  attr_reader :item,
              :fake_sales_engine,
              :example

  def setup
    @item = Item.new({:id => 1, :name => "Item Qui Esse"}, '')
    @example = CSV.open("./data/items.csv", headers: true, header_converters: :symbol).readline
    @fake_sales_engine = SalesEngine.new
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

  def test_item_receives_multiple_lines_of_data_in_a_hash
    assert_equal "Item Qui Esse", item.name
    assert_equal 1, item.id
  end

  def test_invoice_item_method_returns_invoice_items_associated_with_items
    assert_equal 29, Item.new({:id => 1}, fake_sales_engine).invoice_items[0].invoice_id
  end

  def test_merchant_method_returns_first_merchant_associated_with_items
    assert_equal 1, Item.new({:merchant_id => 1}, fake_sales_engine).merchant.id
  end
end
