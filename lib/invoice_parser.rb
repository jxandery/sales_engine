require 'csv'

class InvoiceParser
  attr_reader :file

  def initialize
    @file = CSV.open("./data/invoices.csv", headers: true, header_converters: :symbol)
  end

  def parse
    file.map do |row|
      Invoice.new(row)
    end
  end
end
