require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/transaction_parser.rb'

class TransactionParserTest < Minitest::Test
  def test_it_exists
    transaction_parser = TransactionParser.new
    assert transaction_parser
  end

  def test_it_reads
    transaction_parser = TransactionParser.new
    transaction_parser.parse
    assert transaction_parser.file
  end

  def test_parse_exists
    transaction_parser = TransactionParser.new
    assert transaction_parser.parse
  end

  def test_merchants_have_data
    transaction_parser = TransactionParser.new
    array = transaction_parser.parse
    assert_equal "Schroeder-Jerde", array[0].name
  end
end
