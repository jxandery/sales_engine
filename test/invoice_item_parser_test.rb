require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/invoice_item_parser.rb'

class InvoiceItemParserTest < Minitest::Test
  def test_it_exists
    invoice_item_parser = InvoiceItemParser.new
    assert invoice_item_parser
  end

  def test_it_reads
    invoice_item_parser = InvoiceItemParser.new
    invoice_item_parser.parse
    assert invoice_item_parser.file
  end

  def test_parse_exists
    invoice_item_parser = InvoiceItemParser.new
    assert invoice_item_parser.parse
  end

  def test_merchants_have_data
    invoice_item_parser = InvoiceItemParser.new
    array = invoice_item_parser.parse
    assert_equal 1, array[0].id
  end
end
