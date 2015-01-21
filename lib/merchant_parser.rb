require 'csv'

class MerchantParser
  attr_reader :file

  def initialize
    @file = CSV.open("./data/merchants.csv")
  end
  
end
