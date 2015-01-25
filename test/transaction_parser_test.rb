require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/transaction_parser.rb'

class TransactionParserTest < Minitest::Test

  attr_reader :transaction_parser

  def setup
    @transaction_parser = TransactionParser.new("data", "")
  end

  def test_it_exists
    assert transaction_parser
  end

  def test_it_reads
    transaction_parser.parse
    assert transaction_parser.file
  end

  def test_parse_exists
    assert transaction_parser.parse
  end

  def test_merchants_have_data
    array = transaction_parser.parse
    assert_equal 1, array[0].id
  end
end
