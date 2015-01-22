require 'csv'
require_relative "../lib/invoice_item"

class InvoiceItemParser
  attr_reader :file

  def initialize
  end

  def parse
    @file = CSV.open("../data/invoice_items.csv", :headers => true, :header_converters => :symbol)
    @file.map do |line|
      InvoiceItem.new(line)
    end
  end
end
