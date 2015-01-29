require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :merchant_repo

  def setup
    @merchant_repo = MerchantRepository.new('support', SalesEngine.new('support'))
  end

  def test_repo_exists
    assert merchant_repo
  end

  def test_repo_initializes_and_has_merchants
    assert merchant_repo.merchants.length > 5
  end

  def test_repos_merchants_are_really_merchants
    merchant_repo.parse
    assert merchant_repo.merchants[0].is_a?(Merchant)
  end

  def test_all_method_exists
    merchant_repo.all
  end

  def test_all_method_works
    skip
  end

  def test_random_method_works
    random1 = merchant_repo.random
    random2 = merchant_repo.random
    refute random1 == random2
  end

  def test_find_by_name
    assert_equal 4, merchant_repo.find_by_name("Cummings-Thiel").id
  end

  def test_find_by_id
    assert_equal "Cummings-Thiel", merchant_repo.find_by_id(4).name
  end

  def test_find_by_created_at
    assert_equal 22, merchant_repo.find_by_created_at("2012-03-27 14:54:01 UTC").id
  end

  def test_find_by_updated_at
    assert_equal 1, merchant_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_id
    assert_equal 1,  merchant_repo.find_all_by_id(1)[0].id
  end

  def test_most_revenue_returns_array
    assert merchant_repo.most_revenue(2).is_a?(Array)
  end

  def test_most_revenue_returns_array_of_merchants
    assert merchant_repo.most_revenue(2)[0].is_a?(Merchant)
  end

  def test_most_revenue_returns_merchant_with_most_revenue
    super_merchant_repo = SalesEngine.new('data').merchant_repository
    super_merchant_repo.most_revenue(2).each do |merchant|
      puts merchant.revenue
    end
  end
end
