require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'


class MerchantTest < Minitest::Test

  attr_reader :fake_sales_engine,
              :example

  def setup
    @example = CSV.open("./support/merchants.csv", headers: true, header_converters: :symbol).readline
    @fake_sales_engine = SalesEngine.new('support')
  end

  def test_merchant_class_exists
    data = {:id => 1}
    merchant = Merchant.new(data, "")
    merchant.id = 1
    assert merchant
  end

  def test_merchant_holds_id_number
    data = {:id => 1}
    merchant = Merchant.new(data, "")
    merchant.id = 1
    assert_equal 1, merchant.id
  end

  def test_merchant_hold_name
    merchant = Merchant.new({}, "")
    merchant.name = "NAME"
    assert "NAME", merchant.name
  end

  def test_merchant_can_set_data
    data = {:name => "Phil"}
    merchant = Merchant.new(data, "")
    assert "Phil", merchant.name
  end

  def test_items_returns_items_associated_with_merchants
    assert_equal 1, Merchant.new({:id => 1}, fake_sales_engine).items[0].merchant_id
  end

  def test_invoices_returns_invoices_associated_with_merchants
    assert_equal 26, Merchant.new({:id => 26}, fake_sales_engine).invoices[0].merchant_id
  end

  def test_revenue_returns_a_number
    assert_equal BigDecimal.new('1148393.74'), Merchant.new({:id => 14}, SalesEngine.new).revenue
  end

  # items returns a collection of Item instances associated with that merchant for the products they sell
  # invoices returns a collection of Invoice instances associated with that merchant from their known orders

end
