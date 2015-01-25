require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/invoice_item_parser.rb'

class InvoiceItemParserTest < Minitest::Test

  attr_reader :invoice_item_parser
  
  def setup
    invoice_item_parser = InvoiceItemParser.new("data", "")
  end

  def test_it_exists
    assert invoice_item_parser
  end

  def test_it_reads
    invoice_item_parser.parse
    assert invoice_item_parser.file
  end

  def test_parse_exists
    assert invoice_item_parser.parse
  end

  def test_merchants_have_data
    array = invoice_item_parser.parse
    assert_equal 1, array[0].id
  end
end
