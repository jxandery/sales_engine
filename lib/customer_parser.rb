require 'csv'
require_relative "../lib/customer"

class CustomerParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    @file = CSV.open("./#{filename}/customers.csv", headers: true, header_converters: :symbol)
    @engine = engine
  end

  def parse
    @file.map do |line|
      Customer.new(line, engine)
    end
  end
end
