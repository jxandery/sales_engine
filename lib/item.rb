class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @name = data[:name]
    @description = data[:description]
    @unit_price = data[:unit_price].to_i
    @merchant_id = data[:merchant_id].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

# invoice_items returns a collection of InvoiceItems associated with this object

  def invoice_items
    invoice_items = engine.invoice_item_repository.parse
    invoice_items.select {|invoice_item| invoice_item.item_id == id}
  end

  # merchant returns an instance of Merchant associated with this object

  def merchant
    merchants = engine.merchant_repository.parse
    merchants.detect {|merchant| merchant.id == merchant_id}
  end
end
