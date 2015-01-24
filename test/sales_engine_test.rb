require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new
  end

  def test_there_is_a_sales_engine
    assert sales_engine
  end

  def test_can_make_customer_repo
    sales_engine.customer_repository
  end
end
