require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer_repository'
require 'csv'
require 'pry'

class CustomerRepositoryTest < Minitest::Test

  attr_reader :customer_repository

  def setup
    @customer_repository = CustomerRepository.new("support", "")
    customer_repository.parse
  end

  def test_all_works
    skip
    assert customer_repository.all.length >= 10
  end

  def test_random #if sample is small, occasionally the two random values will equal the same value and the test will result in failed refutation
    skip
    random = customer_repository.random
    random2 = customer_repository.random

    refute random == random2
  end

  def test_find_by_id
    result = customer_repository.find_by_id(5)

    assert_equal "Nader", result.last_name
  end

  def test_find_by_first_name
    result = customer_repository.find_by_first_name("Mariah")

    assert_equal "Toy", result.last_name
  end

  def test_find_by_last_name
    result = customer_repository.find_by_last_name("Osinski")

    assert_equal "Cecelia", result.first_name
  end

  def test_created_at
    result = customer_repository.find_by_created_at("2012-03-27 14:54:10 UTC")
    assert_equal "Osinski", result.last_name
  end

  def test_updated_at
    result = customer_repository.find_by_updated_at("2012-03-27 14:54:10 UTC")

    assert_equal "Cecelia", result.first_name
  end

  def test_find_all_by_id
    result = customer_repository.find_all_by_id(2)

    assert_equal "Osinski", result[0].last_name
  end

  def test_find_all_by_first_name #test not very robust because many customers have the same created at stamp
    result = customer_repository.find_all_by_first_name("Cecelia")

    assert_equal "Osinski", result[0].last_name
  end

  def test_find_all_by_last_name
    result = customer_repository.find_all_by_last_name("Ondricka")

    assert_equal "Joey", result[0].first_name
  end

  def test_find_all_by_created_at
    result = customer_repository.find_all_by_created_at("2012-03-27 14:54:10 UTC")

    assert_equal "Mariah", result[1].first_name
  end

  def test_find_all_by_updated_at
    result = customer_repository.find_all_by_updated_at("2012-03-27 14:54:10 UTC")

    assert_equal "Nader", result[-1].last_name
  end

end
