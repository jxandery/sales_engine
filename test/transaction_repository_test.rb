require 'minitest/autorun'
require 'minitest/pride'
require '../lib/transaction_repository'
require 'csv'
require 'pry'

class TransactionRepositoryTest < Minitest::Test

  attr_reader :transaction_repository

  def setup
    @transaction_repository = TransactionRepository.new("../data/transactions.csv")
  end

  def test_all_works
    assert transaction_repository.all.length >= 10
  end

  def test_random
    random = transaction_repository.random
    random2 = transaction_repository.random

    refute random == random2
  end

  def test_find_by_id
    result = transaction_repository.find_by_id("11")

    assert_equal 4800749911485986, result.credit_card_number
  end

  def test_find_by_invoice_id
    result = transaction_repository.find_by_invoice_id("21")

    assert_equal 4252153331154380, result.credit_card_number
  end

  def test_find_by_credit_card_number
    result = transaction_repository.find_by_credit_card_number("4094113568951317")

    assert_equal 30, result.invoice_id
  end

  def test_find_by_credit_card_expiration_date #No expiration dates available in csv file
    result = transaction_repository.find_by_credit_card_expiration_date(" ")[0]

    assert_equal 654405418249632, result.credit_card_number
  end

  def test_find_by_result #test not very robust because many transactions have the same result
    skip
    result = transaction_repository.find_by_result("failed")

    assert_equal 4800749911485986, result.credit_card_number
  end

  def test_find_by_created_at #test not very robust because many transactions have the same created at stamp
    skip
    result = transaction_repository.find_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal 4354495077693036, result.credit_card_number
  end

  def test_find_by_updated_at #test not very robust because many transactions have the same updated at stamp
    skip
    result = transaction_repository.find_by_updated_at("2012-03-27 14:54:11 UTC")

    assert_equal 4822758023695469, result.credit_card_number
  end

  # def test_find_all_by_id
  #   result = transaction_repository.find_all_by_id("86")
  #
  #   assert_equal "Lindgren", result.credit_card_number[0]
  # end
end
