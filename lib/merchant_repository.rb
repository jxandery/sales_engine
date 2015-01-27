require_relative 'merchant_parser'

class MerchantRepository
attr_reader :merchants,
            :file,
            :engine

  def initialize(filename, engine)
    @engine = engine
    @file = filename
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end
  
  def parse
    merchants = MerchantParser.new(file, engine)
    @merchants = merchants.parse
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

  def find_all_by_name(name)
    merchants.select {|merchant| merchant.name == name}
  end

  def find_all_by_id(id_num)
    merchants.select {|merchant| merchant.id == id_num}
  end

  def find_all_by_created_at(date)
    merchants.select {|merchant| merchant.created_at == date}
  end

  def find_all_by_updated_at(date)
    merchants.select {|merchant| merchant.updated_at == date}
  end



end
