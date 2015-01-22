require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  attr_reader :item_repo

  def setup
    @item_repo = ItemRepository.new
  end

  def test_repo_exists
    assert item_repo
  end

  def test_repo_has_items
    assert item_repo.items
  end

  def test_repo_items_is_an_array
    assert item_repo.items.is_a?(Array)
  end

  def test_items_is_array_of_items
    assert item_repo.items[0].is_a?(Item)
    assert item_repo.items[1].is_a?(Item)
  end

  def test_there_is_an_all_method
    assert item_repo.all
  end
  
  def test_all_gives_all_items_in_array
    skip
    assert_equal item_repo.items > 10 
  end

  def test_find_by_name_works
    assert_equal 1, item_repo.find_by_name("Item Qui Esse").id
  end

  def test_find_by_id
    assert_equal "Item Qui Esse", item_repo.find_by_id("1").name
  end

  def test_find_by_description
    assert_equal 1, item_repo.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.").id
  end

  def test_find_by_unit
    assert_equal 1, item_repo.find_by_unit(75107).id
  end

  def test_find_by_merchant_id
    assert_equal "Item Qui Esse", item_repo.find_by_merchant_id(1).name
  end

  def test_find_by_created_at
    assert_equal "Item Qui Esse", item_repo.find_by_created_at("2012-03-27 14:53:59 UTC").name
  end

  def test_find_by_updated_at
    assert_equal "Item Qui Esse", item_repo.find_by_updated_at("2012-03-27 14:53:59 UTC").name
  end
end
