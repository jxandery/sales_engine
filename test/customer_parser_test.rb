require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/customer_parser.rb'

class CustomerParserTest < Minitest::Test
  def test_it_exists
    customer_parser = CustomerParser.new
    assert customer_parser
  end

  def test_it_reads
    customer_parser = CustomerParser.new
    customer_parser.parse
    assert customer_parser.file
  end

  def test_parse_exists
    customer_parser = CustomerParser.new
    assert customer_parser.parse
  end

  def test_merchants_have_data
    customer_parser = CustomerParser.new
    array = customer_parser.parse
    assert_equal "Schroeder-Jerde", array[0].name
  end
end
