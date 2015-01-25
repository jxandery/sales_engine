class Invoice
  attr_reader :name, 
              :customer_id, 
              :merchant_id, 
              :status, 
              :created_at, 
              :updated_at,
              :engine

  def initialize(data, engine)
    @name = data[:name]
    @customer_id = data[:customer_id]
    @merchant_id = data[:merchant_id]
    @status = data[:status]
    @created_at = data[:created_at]
    @engine = engine
  end
end
