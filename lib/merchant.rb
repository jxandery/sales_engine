class Merchant
  attr_accessor :id,
                :name,
                :created_at,
                :updated_at,
                :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  def items
    items = engine.item_repository.parse
    items.select {|item| item.merchant_id == id}
  end

  def invoice
    invoices = engine.invoice_repository.parse
    invoices.select {|invoice| invoice.merchant_id == id}
  end


end
