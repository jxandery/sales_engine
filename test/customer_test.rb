require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/customer'
require 'csv'

class CustomerTest < Minitest::Test

  attr_reader :fake_sales_engine,
              :example

  def setup
    @example = CSV.open("./data/customers.csv", headers: true, header_converters: :symbol).readline
    @fake_sales_engine = SalesEngine.new
  end

  def test_valid_first_name
    customer_example = Customer.new(example, "")

    assert_equal "Joey", customer_example.first_name
  end

  def test_valid_last_name
    customer_example = Customer.new(example,"")

    assert_equal "Ondricka", customer_example.last_name
  end

  def test_valid_id
    customer_example = Customer.new(example,"")

    assert_equal 1, customer_example.id
  end

  def test_valid_created_at
    customer_example = Customer.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", customer_example.created_at
  end


  def test_valid_updated_at
    customer_example = Customer.new(example,"")

    assert_equal "2012-03-27 14:54:09 UTC", customer_example.updated_at
  end

  # invoices returns a collection of Invoice instances associated with this object.
  def test_invoice_method_returns_collection_of_invoices_associated_with_customers
    assert_equal 12, Customer.new({:id => 12}, fake_sales_engine).invoice.customer_id
  end
end
