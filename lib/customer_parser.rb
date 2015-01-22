require 'csv'
require_relative "../lib/customer"

class CustomerParser
  attr_reader :file

  def initialize
  end

  def parse
    @file = CSV.open("../data/customers.csv", :headers => true, :header_converters => :symbol)
    @file.map do |line|
      Customer.new(line)
    end
  end
end
