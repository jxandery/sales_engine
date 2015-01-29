require 'csv'
require_relative "../lib/merchant"

class MerchantParser
  attr_reader :file,
              :engine

  def initialize(filename, engine)
    read = "#{filename}/merchants.csv"
    @file = CSV.open(read, headers: true, header_converters: :symbol)
    @engine = engine
  end

  def parse
    @file.map do |line|
      Merchant.new(line, engine)
    end
  end

end
