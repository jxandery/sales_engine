require 'date'

class Invoice
 attr_reader  :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status = data[:status]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  def transactions
    transactions = engine.transaction_repository.parse
    transactions.select {|transaction| transaction.invoice_id == id}
  end

  def invoice_items
    invoice_item_collection = engine.invoice_item_repository.parse
    invoice_item_collection.select do |invoice_item|
      invoice_item.invoice_id == id
    end
  end

  def items
    invoice_items.map do |invoice_item|
      engine.item_repository.find_by_id(invoice_item.item_id)
    end
  end

  def customer
    customers = engine.customer_repository.parse
    customers.detect {|customer| customer.id == customer_id}
  end

  def merchant
    merchants = engine.merchant_repository.parse
    merchants.detect {|merchant| merchant.id == merchant_id}
  end

  def amount
    invoice_items.inject(0) do |sum, invoice_item|
      sum + (invoice_item.unit_price * invoice_item.quantity)
    end
  end
end
