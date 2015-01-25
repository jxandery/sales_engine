require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_repository'

class InvoiceRepoTest < Minitest::Test
  attr_reader :invoice_repo

  def setup
    @invoice_repo = InvoiceRepository.new('data', '')
    invoice_repo.parse
  end

  def test_repo_exists
    assert invoice_repo
  end

  def test_it_uses_parser_to_get_invoices
    invoice_repo.parse
    assert invoice_repo.invoices.is_a?(Array)
    assert invoice_repo.invoices[0].is_a?(Invoice)
  end

  def test_invoices_is_set
    invoice_repo.parse
    assert invoice_repo.invoices
  end

  def test_all_method
    skip
    assert_equal invoice_repo.all == invoice_repo.invoices
  end

  def test_random_is_kind_of_random
    refute invoice_repo.random == invoice_repo.random
  end

  def find_by_id
    assert_equals 1, invoice_repo.find_by_id(1).merchant_id
  end
end
