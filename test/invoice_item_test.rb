require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item'
require 'csv'

class InvoiceItemTest < Minitest::Test

  def test_valid_id
    example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal 1, invoice_item_example.id
    end

  def test_valid_item_id
    example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    invoice_item_example = InvoiceItem.new(example, "")

    assert_equal 539, invoice_item_example.item_id
  end

  def test_valid_invoice_id
    example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal 1, invoice_item_example.invoice_id
  end

  def test_valid_quantity
    example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal 5, invoice_item_example.quantity
  end

  def test_valid_unit_price
    example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal 13635, invoice_item_example.unit_price
  end

  def test_valid_created_at
    example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item_example.created_at
  end


  def test_valid_updated_at
    example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item_example.updated_at
  end


end
