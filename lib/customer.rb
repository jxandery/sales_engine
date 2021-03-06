class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  def invoices
    invoices = engine.invoice_repository.parse

    invoices.select {|invoice| invoice.customer_id == id}
  end
end
