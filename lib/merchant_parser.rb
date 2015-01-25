require 'csv'
require_relative "../lib/merchant"

class MerchantParser
  attr_reader :file,
              :engine
 
  def initialize(engine)
    @engine = engine
  end

  def parse
    @file = CSV.open("./data/merchants.csv", :headers => true, :header_converters => :symbol)
    @file.map do |line|
      Merchant.new(line, engine)
    end
  end
end
