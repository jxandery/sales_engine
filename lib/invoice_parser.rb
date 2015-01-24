require 'csv'

class InvoiceParser
  attr_reader :file

  def initialize(filename)
    @file = CSV.open("./#{filename}/invoices.csv", headers: true, header_converters: :symbol)
  end

  def parse
    file.map do |row|
      Invoice.new(row)
    end
  end
end
