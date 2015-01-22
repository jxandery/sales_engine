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

  def find_by_name(name)
    merchants.detect {|merchant| merchant.name == name}
  end
  
  def find_by_id(id_num)
    merchants.detect {|merchant| merchant.id == id_num}
  end

  def find_by_created_at(date)
    merchants.detect {|merchant| merchant.created_at == date}
  end

  def find_by_updated_at(date)
    merchants.detect {|merchant| merchant.updated_at == date}
  end
end