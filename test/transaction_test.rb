require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction'
require_relative '../lib/sales_engine'
require 'csv'

class TransactionTest < Minitest::Test

  attr_reader :fake_sales_engine,
              :example

  def setup
    @example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    @fake_sales_engine  = SalesEngine.new
  end

  def test_valid_id
    transaction_example = Transaction.new(example,"")

    assert_equal 1, transaction_example.id
  end

  def test_valid_invoice_id
    transaction_example = Transaction.new(example,"")

    assert_equal 1, transaction_example.invoice_id
  end

  def test_valid_credit_card_number
    transaction_example = Transaction.new(example, "")

    assert_equal 4654405418249632, transaction_example.credit_card_number
  end

  def test_valid_credit_card_expiration_date
    transaction_example = Transaction.new(example, "")

    assert_equal 0, transaction_example.credit_card_expiration_date
  end

  def test_valid_result
    transaction_example = Transaction.new(example, "")

    assert_equal "success", transaction_example.result
  end

  def test_valid_created_at
    transaction_example = Transaction.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", transaction_example.created_at
  end


  def test_valid_updated_at
    transaction_example = Transaction.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", transaction_example.updated_at
  end

  def test_invoice_method_returns_first_invoice_associated_with_transaction
    assert_equal 12, Transaction.new({:invoice_id => 12}, fake_sales_engine).invoice.id
  end

end
