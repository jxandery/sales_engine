require 'csv'

class InvoiceParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    @file = CSV.open("./#{filename}/invoices.csv", headers: true, header_converters: :symbol)
    @engine = engine
  end

  def parse
    file.map do |row|
      Invoice.new(row, engine)
    end
  end
end
