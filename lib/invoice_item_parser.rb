require 'csv'
require_relative "../lib/invoice_item"

class InvoiceItemParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    read = "#{filename}/invoice_items.csv"
    @file = CSV.open(read, headers: true, header_converters: :symbol)
    @engine = engine
  end

  def parse
    @file.map do |line|
      InvoiceItem.new(line, engine)
    end
  end
end
