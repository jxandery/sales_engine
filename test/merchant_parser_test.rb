require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/merchant_parser.rb'

class MerchantParserTest < Minitest::Test
  def test_it_exists
    merchant_parser = MerchantParser.new
    assert merchant_parser
  end
  
  def test_parser_reads_cvs
    merchant_parser = MerchantParser.new
    assert merchant_parser.file
  end
end
