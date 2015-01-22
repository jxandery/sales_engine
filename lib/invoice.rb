class Invoice
  attr_reader :name, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(data)
    @name = data[:name]
    @customer_id = data[:customer_id]
    @merchant_id = data[:merchant_id]
    @status = data[:status]
    @created_at = data[:created_at]
  end
end
