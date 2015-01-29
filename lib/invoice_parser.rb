require 'csv'
require_relative 'invoice'

class InvoiceParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    read = "#{filename}/invoices.csv"
    @file = CSV.open(read, headers: true, header_converters: :symbol)
    @engine = engine
  end

  def parse
    file.map do |row|
      Invoice.new(row, engine)
    end
  end
end
