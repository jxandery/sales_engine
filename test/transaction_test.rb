require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/transaction'
require 'csv'

class TransactionTest < Minitest::Test

  def test_valid_id
    example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    transaction_example = Transaction.new(example,"")

    assert_equal 1, transaction_example.id
  end

  def test_valid_invoice_id
    example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    transaction_example = Transaction.new(example,"")

    assert_equal 1, transaction_example.invoice_id
  end

  def test_valid_credit_card_number
    example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    transaction_example = Transaction.new(example, "")

    assert_equal 4654405418249632, transaction_example.credit_card_number
  end

  def test_valid_credit_card_expiration_date
    example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    transaction_example = Transaction.new(example, "")

    assert_equal 0, transaction_example.credit_card_expiration_date
  end

  def test_valid_result
    example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    transaction_example = Transaction.new(example, "")

    assert_equal "success", transaction_example.result
  end

  def test_valid_created_at
    example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    transaction_example = Transaction.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", transaction_example.created_at
  end


  def test_valid_updated_at
    example = CSV.open("./data/transactions.csv", headers: true, header_converters: :symbol).readline
    transaction_example = Transaction.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", transaction_example.updated_at
  end

end
