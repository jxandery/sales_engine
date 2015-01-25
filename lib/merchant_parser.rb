require 'csv'
require_relative "../lib/merchant"

class MerchantParser
  attr_reader :file,
              :engine,
              :data
 
  def initialize(data, engine)
    @engine = engine
    @data = data
  end

  def parse
    @file = CSV.open("./#{data}/merchants.csv", :headers => true, :header_converters => :symbol)
    @file.map do |line|
      Merchant.new(line, engine)
    end
  end
end
