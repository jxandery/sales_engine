require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/merchant_parser.rb'

class MerchantParserTest < Minitest::Test
  def test_it_exists
    merchant_parser = MerchantParser.new
    assert merchant_parser
  end

  def test_it_reads
    merchant_parser = MerchantParser.new
    merchant_parser.parse
    assert merchant_parser.file
  end

  def test_parse_exists
    merchant_parser = MerchantParser.new
    assert merchant_parser.parse
  end
  
  def test_merchants_have_data
    merchant_parser = MerchantParser.new
    array = merchant_parser.parse
    assert_equal "Schroeder-Jerde", array[0].name
  end
end
