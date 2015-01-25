require 'csv'
require_relative "../lib/merchant"

class MerchantParser
  attr_reader :file,
              :engine,
 
  def initialize(filename, engine)
    @engine = engine
    @file = filename
  end

  def parse
    data = read_file
    data.map do |line|
      Merchant.new(line, engine)
    end
  end

  def read_file
    CSV.open("./#{file}/merchants.csv", :headers => true, :header_converters => :symbol)
  end
end
