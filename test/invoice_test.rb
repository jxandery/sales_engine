require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  attr_reader :invoice

  def setup
    @invoice = Invoice.new({:name => "name"})
  end

  def test_invoice_exists
    assert invoice
  end
  
  def test_it_holds_attributes
    assert invoice.name
  end

  def test_takes_in_hash_and_sets_data
    assert_equal "name", invoice.name
  end
end
