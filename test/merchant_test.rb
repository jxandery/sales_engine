require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/merchant.rb'

class FakeMerchantParser
end

class MerchantTest < Minitest::Test
  def test_merchant_class_exists
    data = {:id => 1} 
    merchant = Merchant.new(data)
    merchant.id = 1
    assert merchant
  end

  def test_merchant_holds_id_number
    data = {:id => 1}
    merchant = Merchant.new(data)
    merchant.id = 1
    assert_equal 1, merchant.id
  end

  def test_merchant_hold_name
    merchant = Merchant.new({})
    merchant.name = "NAME"
    assert "NAME", merchant.name
  end
  
  def test_merchant_can_set_data
    data = {:name => "Phil"}
    merchant = Merchant.new(data)
    assert "Phil", merchant.name
  end
end
