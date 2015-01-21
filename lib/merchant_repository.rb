require_relative 'merchant_parser'

class MerchantRepository
attr_reader :merchants

  def initialize
    @merchants = MerchantParser.new.parse
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end
end
