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

  def paid_invoices
    invoices.select do |invoice|
      invoice.transactions.any? {|transaction| transaction.successful?}
    end
  end

  def revenue(date=nil)
    if date
      selected_invoices = paid_invoices.select do |invoice|
        invoice.updated_at == date
      end
    else
      selected_invoices = paid_invoices
    end
    selected_invoices.inject(0) {|revenue, invoice| revenue + invoice.amount }
  end
end
