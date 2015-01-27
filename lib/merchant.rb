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

  def invoices
    invoices = engine.invoice_repository.parse
    invoices.select {|invoice| invoice.merchant_id == id}
  end

  def revenue
    items.inject(0) do |item_revenue, item|
      item_revenue.+(item_adder(item))
    end
  end

  def item_adder(item)
    item.invoice_items.inject(0) do |item_revenue, invoice_item|
      item_revenue.+((invoice_item.quantity * invoice_item.unit_price))
    end
  end


end
