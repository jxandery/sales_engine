require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/customer_parser.rb'

class CustomerParserTest < Minitest::Test

  attr_reader :customer_parser
  
  def setup
    @customer_parser = CustomerParser.new("data", "")
  end

  def test_it_exists
    assert customer_parser
  end

  def test_it_reads
    customer_parser.parse
    assert customer_parser.file
  end

  def test_parse_exists
    assert customer_parser.parse
  end

  def test_merchants_have_data
    array = customer_parser.parse
    assert_equal "Joey", array[0].first_name
  end
end
