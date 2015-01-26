require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'
require_relative '../lib/sales_engine'

class InvoiceTest < Minitest::Test
  attr_reader :invoice

  def setup
    fake_sales_engine = SalesEngine.new
    @invoice = Invoice.new({:id => "1"}, fake_sales_engine)
  end

  def test_invoice_exists
    assert invoice
  end
  
  def test_it_holds_attributes
    assert invoice.id
  end

  def test_takes_in_hash_and_sets_data
    assert_equal 1, invoice.id
  end

  def test_transactions_returns_collection_of_associated_transactions
    assert 1, invoice.transactions[0].id
  end
end
