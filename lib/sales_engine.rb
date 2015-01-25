require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'customer_repository'
require_relative 'transaction_repository'
require_relative 'merchant_repository'

class SalesEngine
  attr_reader :data

  def initialize(data='data')
    @data = data
  end

  def customer_repository 
   #@customer_repository = CustomerRepository.new(data, self)
  end

  def invoice_item_repository
   # @invoice_item_repository = InvoiceItemRepository.new(data, self)
  end

  def invoice_repository
    @invoice_repository = InvoiceRepository.new(self)
  end

  def item_repository
    @item_repository = ItemRepository.new(self)
  end

  def transaction_repository
    #@transaction_repository = TransactionRepository.new(data, self)
  end

  def merchant_repository
  #  @merchant_repository = MerchantRepository.new(self)
  end
end
