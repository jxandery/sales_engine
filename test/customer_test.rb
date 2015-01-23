require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'
require 'csv'

class CustomerTest < Minitest::Test

  def test_valid_first_name
    example = CSV.open("../data/customers.csv", headers: true, header_converters: :symbol).readline
    customer_example = Customer.new(example)

    assert_equal "Joey", customer_example.first_name
  end

  def test_valid_last_name
    example = CSV.open("../data/customers.csv", headers: true, header_converters: :symbol).readline
    customer_example = Customer.new(example)

    assert_equal "Ondricka", customer_example.last_name
  end

  def test_valid_id
    example = CSV.open("../data/customers.csv", headers: true, header_converters: :symbol).readline
    customer_example = Customer.new(example)

    assert_equal 1, customer_example.id
  end

  def test_valid_created_at
    example = CSV.open("../data/customers.csv", headers: true, header_converters: :symbol).readline
    customer_example = Customer.new(example)

    assert_equal "2012-03-27 14:54:09 UTC", customer_example.created_at
  end


  def test_valid_updated_at
    example = CSV.open("../data/customers.csv", headers: true, header_converters: :symbol).readline
    customer_example = Customer.new(example)

    assert_equal "2012-03-27 14:54:09 UTC", customer_example.updated_at
  end

  
end
