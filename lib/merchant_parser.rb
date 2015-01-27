require 'csv'
require_relative "../lib/merchant"

class MerchantParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    @file = CSV.open("./#{filename}/merchants.csv", headers: true, header_converters: :symbol)
    @engine = engine
  end

  def parse
    @file.map do |line|
      Merchant.new(line, engine)
    end
  end

end
