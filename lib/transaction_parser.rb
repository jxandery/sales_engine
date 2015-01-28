require 'csv'
require_relative "../lib/transaction"

class TransactionParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    @file = CSV.open("#{filename}/transactions.csv", :headers => true, :header_converters => :symbol)
    @engine = engine
  end

  def parse
    @file.map do |line|
      Transaction.new(line, engine)
    end
  end
end
