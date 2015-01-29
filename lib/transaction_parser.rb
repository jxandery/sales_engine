require 'csv'
require_relative "../lib/transaction"

class TransactionParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    read = "#{filename}/transactions.csv"
    @file = CSV.open(read, :headers => true, :header_converters => :symbol)
    @engine = engine
  end

  def parse
    @file.map do |line|
      Transaction.new(line, engine)
    end
  end
end
