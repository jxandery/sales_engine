require 'minitest/autorun'
require 'minitest/pride'
require '../lib/transaction_repository'
require 'csv'
require 'pry'

class TransactionRepositoryTest < Minitest::Test

  attr_reader :transaction_repository

  def setup
    @transaction_repository = TransactionRepository.new("../support/transactions_test_helper.csv")
  end

  def test_all_works
    skip
    assert transaction_repository.all.length >= 10
  end

  def test_random
    random = transaction_repository.random
    random2 = transaction_repository.random

    refute random == random2
  end

  def test_find_by_id
    result = transaction_repository.find_by_id(2)

    assert_equal 4580251236515201, result.credit_card_number
  end

  def test_find_by_invoice_id
    result = transaction_repository.find_by_invoice_id(4)

    assert_equal 4354495077693036, result.credit_card_number
  end

  def test_find_by_credit_card_number
    result = transaction_repository.find_by_credit_card_number(4354495077693036)

    assert_equal 4, result.invoice_id
  end

  def test_find_by_credit_card_expiration_date #No expiration dates available in csv file
    skip
    result = transaction_repository.find_by_credit_card_expiration_date("")

    assert_equal 4654405418249632, result.credit_card_number
  end

  def test_find_by_result #test not very robust because many transactions have the same result
    result = transaction_repository.find_by_result("success")

    assert_equal 4654405418249632, result.credit_card_number
  end

  def test_find_by_created_at #test not very robust because many transactions have the same created at stamp
    skip
    result = transaction_repository.find_by_created_at(input)
    assert_equal 4354495077693036, result.credit_card_number
  end

  def test_find_by_updated_at #test not very robust because many transactions have the same updated at stamp
    skip
    result = transaction_repository.find_by_updated_at(input)

    assert_equal 4822758023695469, result.credit_card_number
  end

  # def test_find_all_by_id
  #   result = transaction_repository.find_all_by_id("86")
  #
  #   assert_equal "Lindgren", result.credit_card_number[0]
  # end
end
