require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/invoice_parser'

class InvoiceParserTest < Minitest::Test
  attr_reader :invoice_parser

  def setup
    @invoice_parser = InvoiceParser.new
  end

  def test_invoice_parser_exitsts
    assert invoice_parser
  end

  def test_file_is_read
    assert invoice_parser.file
  end

  def test_parse_makes_array
    parsed = invoice_parser.parse
    assert parsed.is_a?(Array)
  end
end
