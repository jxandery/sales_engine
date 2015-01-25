require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/merchant_parser.rb'

class MerchantParserTest < Minitest::Test
  attr_reader :merchant_parser,
              :merchants

  def setup
    @merchant_parser = MerchantParser.new('data', '')
    @merchants = merchant_parser.parse
  end

  def test_it_exists
    assert merchant_parser
  end

  def test_it_reads
    merchant_parser.parse
    assert merchant_parser.file
  end

  def test_parse_exists
    assert merchant_parser.parse
  end
  
  def test_merchants_have_data
    assert_equal "Schroeder-Jerde", merchants[0].name
  end
end
