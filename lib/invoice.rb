class Invoice
  attr_reader :id, 
              :customer_id, 
              :merchant_id, 
              :status, 
              :created_at, 
              :updated_at,
              :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @customer_id = data[:customer_id]
    @merchant_id = data[:merchant_id]
    @status = data[:status]
    @created_at = data[:created_at]
    @engine = engine
  end

  def transactions
    transactions = engine.transaction_repository.parse
    transactions.select {|transaction| transaction.invoice_id == id}
  end
end
