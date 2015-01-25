require 'csv'
require_relative "../lib/invoice_item"

class InvoiceItemParser
  attr_reader :file

  def initialize(filename, engine)
    @file = CSV.open("../data/invoice_items.csv", :headers => true, :header_converters => :symbol)
  end

  def parse
    @file.map do |line|
      InvoiceItem.new(line)
    end
  end
end
