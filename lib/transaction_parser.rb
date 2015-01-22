require 'csv'
require_relative "../lib/transaction"

class TransactionParser
  attr_reader :file

  def initialize
  end

  def parse
    @file = CSV.open("../data/transactions.csv", :headers => true, :header_converters => :symbol)
    @file.map do |line|
      Transaction.new(line)
    end
  end
end
