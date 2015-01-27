class InvoiceItem

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @item_id = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity = data[:quantity].to_i
    @unit_price = data[:unit_price].to_i
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  def invoice
    repo = engine.invoice_repository
    repo.parse
    invoices = repo.invoices
    invoices.detect {|invoice| invoice.id == invoice_id}
  end

  def item
    repo = engine.item_repository
    repo.parse
    items = repo.items
    items.detect {|item| item.id == item_id}
  end

end
