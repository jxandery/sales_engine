class Invoice
  attr_reader :id,
              :name,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @name = data[:name]
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status = data[:status]
    @created_at = data[:created_at]
    @engine = engine
  end

end
