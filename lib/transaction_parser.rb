require 'csv'
require_relative "../lib/transaction"

class TransactionParser
  attr_reader :file

  def initialize(filename, engine)
    @file = CSV.open("../data/transactions.csv", :headers => true, :header_converters => :symbol)
  end

  def parse
    @file.map do |line|
      Transaction.new(line)
    end
  end
end
