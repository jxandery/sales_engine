require 'minitest/autorun'
require 'minitest/pride'
require '../lib/customer_repository'
require 'csv'
require 'pry'

class CustomerRepositoryTest < Minitest::Test

  attr_reader :customer_repository

  def setup
    @customer_repository = CustomerRepository.new("../data/customers.csv")
  end

  def test_all_works
    assert customer_repository.all.length >= 10
  end

  def test_random
    random = customer_repository.random
    random2 = customer_repository.random

    refute random == random2
  end

  def test_find_by_id
    result = customer_repository.find_by_id("86")

    assert_equal "Lindgren", result.last_name
  end

  def test_find_by_first_name
    result = customer_repository.find_by_first_name("Grace")

    assert_equal "Bogan", result.last_name
  end

  def test_find_by_last_name
    result = customer_repository.find_by_last_name("Flatley")

    assert_equal "Ron", result.first_name
  end

  def test_created_at #test not very robust because many customers have the same created at stamp
  result = customer_repository.find_by_created_at("2012-03-27 14:54:16 UTC")
  assert_equal "Nader", result.last_name
  end

  def test_updated_at #test not very robust because many customers have the same updated at stamp
    result = customer_repository.find_by_updated_at("2012-03-27 14:54:20 UTC")

    assert_equal "Shaun", result.first_name
  end

  def test_find_all_by_id
    result = customer_repository.find_all_by_id("86")
puts result
    assert_equal "Lindgren", result[0].last_name
  end

end
