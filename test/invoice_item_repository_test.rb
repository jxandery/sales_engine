require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_item_repository'
require 'csv'
require 'pry'

class InvoiceItemRepositoryTest < Minitest::Test

    attr_reader :invoice_item_repository

    def setup
      @invoice_item_repository = InvoiceItemRepository.new("support", "")
      invoice_item_repository.parse
    end

    def test_it_all_works
      skip
      assert invoice_item_repository.all.length >= 10
    end

    def test_random
      skip
      random = invoice_item_repository.random
      random2 = invoice_item_repository.random

      refute random == random2
    end

    def test_find_by_id
      result = invoice_item_repository.find_by_id(2)

      assert_equal 528, result.item_id
    end

    def test_find_by_item_id
      result = invoice_item_repository.find_by_item_id(535)

      assert_equal 4, result.id
    end

    def test_find_by_invoice_id
      result = invoice_item_repository.find_by_invoice_id(1)

      assert_equal 1, result.id
    end

    def test_find_by_quantity #test not very robust because many invoice items have the same quantity
      result = invoice_item_repository.find_by_quantity(7)

      assert_equal 5, result.id
    end

    def test_find_by_unit_price #test not very robust because many invoice items have the same unit price
      result = invoice_item_repository.find_by_unit_price(23324)

      assert_equal 2, result.id
    end

    def test_find_by_created_at #test not very robust because many invoice items have the same created at stamp
      result = invoice_item_repository.find_by_created_at("2012-03-27 14:54:09 UTC")

      assert_equal 1, result.id
    end

    def test_find_by_updated_at
      result = invoice_item_repository.find_by_updated_at("2012-03-27 14:54:09 UTC")

      assert_equal 1, result.id
    end

    def test_find_all_by_id
      result = invoice_item_repository.find_all_by_id(1)

      assert_equal 5, result[0].quantity
    end

    def test_find_all_by_item_id
      result = invoice_item_repository.find_all_by_item_id(523)

      assert_equal 3, result[0].id
    end

    def test_find_all_by_invoice_id
      result = invoice_item_repository.find_all_by_invoice_id(1)

      assert_equal 2, result[1].id
    end

    def test_find_all_by_quantity
      result = invoice_item_repository.find_all_by_quantity(7)

      assert_equal 5, result[-1].id
    end

    def test_find_all_by_unit_price
      result = invoice_item_repository.find_all_by_unit_price(34873)

      assert_equal 3, result[0].id
    end

    def test_find_all_by_created_at
      result = invoice_item_repository.find_all_by_created_at("2012-03-27 14:54:09 UTC")

      assert_equal 2, result[1].id
    end

    def test_find_all_by_updated_at
      result = invoice_item_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC")

      assert_equal 4, result[-2].id
    end
end
