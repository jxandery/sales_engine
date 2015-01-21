require 'minitest/autorun'
require 'minitest/pride'
require '../lib/invoice_item_repository'
require 'csv'
require 'pry'

class InvoiceItemRepositoryTest < Minitest::Test

    attr_reader :invoice_item_repository

    def setup
      @invoice_item_repository = InvoiceItemRepository.new("../data/invoice_items.csv")
    end

    def test_it_all_works
      assert invoice_item_repository.all.length >= 10
    end

    def test_random
      random = invoice_item_repository.random
      random2 = invoice_item_repository.random

      refute random == random2
    end

    def test_find_by_id
      result = invoice_item_repository.find_by_id("21")

      assert_equal 680, result.item_id
    end

    def test_find_by_item_id
      result = invoice_item_repository.find_by_item_id("1849")

      assert_equal 11, result.id
    end

    def test_find_by_invoice_id #test not very robust because many invoice items have the same invoice id
      result = invoice_item_repository.find_by_invoice_id("1")

      assert_equal 1, result.id
    end

    def test_find_by_quantity #test not very robust because many invoice items have the same quantity
      result = invoice_item_repository.find_by_quantity("4")

      assert_equal 7, result.id
    end

    def test_find_by_unit_price #test not very robust because many invoice items have the same unit price
      result = invoice_item_repository.find_by_unit_price("34423")

      assert_equal 33, result.id
    end

    def test_find_by_created_at #test not very robust because many invoice items have the same created at stamp
      result = invoice_item_repository.find_by_created_at("2012-03-27 14:54:10 UTC")

      assert_equal 16, result.id
    end

    def test_find_by_updated_at #test not very robust because many invoice items have the same updated at stamp
      result = invoice_item_repository.find_by_updated_at("2012-03-27 14:54:11 UTC")

      assert_equal 113, result.id
    end

    # def test_find_all_by_id
    #   result = transaction_repository.find_all_by_id("86")
    #
    #   assert_equal "Lindgren", result.last_name[0]
    # end

end
