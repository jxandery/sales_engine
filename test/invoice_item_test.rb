require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require_relative '../lib/invoice_item'
require 'csv'


class InvoiceItemTest < Minitest::Test
  attr_reader :fake_sales_engine,
              :example

  def setup
    @example = CSV.open("./data/invoice_items.csv", headers: true, header_converters: :symbol).readline
    @fake_sales_engine = SalesEngine.new
  end

  def test_valid_id
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal 1, invoice_item_example.id
    end

  def test_valid_item_id
    invoice_item_example = InvoiceItem.new(example, "")

    assert_equal 539, invoice_item_example.item_id
  end

  def test_valid_invoice_id
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal 1, invoice_item_example.invoice_id
  end

  def test_valid_quantity
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal 5, invoice_item_example.quantity
  end

  def test_valid_unit_price
    invoice_item_example = InvoiceItem.new(example,"")

    assert invoice_item_example.unit_price.is_a?(BigDecimal)
  end

  def test_valid_created_at
    invoice_item_example = InvoiceItem.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item_example.created_at
  end


  def test_valid_updated_at
   invoice_item_example = InvoiceItem.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", invoice_item_example.updated_at
  end

  def test_invoice_returns_an_associated_invoice
    assert_equal 1, InvoiceItem.new(example, fake_sales_engine).invoice.id
  end

  def test_item_retuns_one_associated_item
    assert_equal 539, InvoiceItem.new(example, fake_sales_engine).item.id
  end
end
