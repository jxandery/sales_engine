require 'csv'
require_relative "../lib/customer"

class CustomerParser
  attr_reader :file

  def initialize(filename, engine)
    @file = CSV.open("../data/customers.csv", headers: true, header_converters: :symbol)
  end

  def parse
    @file.map do |line|
      Customer.new(line)
    end
  end
end
