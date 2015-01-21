require_relative 'invoice_item'

class InvoiceItemRepository

  attr_reader :invoice_items

  def initialize(filename)
    from_csv(filename)
  end

  def from_csv(filename)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    @invoice_items = rows.map {|row| InvoiceItem.new(row)}
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(input)
    invoice_items.detect { |item| item.id == 21}
  end

  def find_by_item_id(input)
    invoice_items.detect { |item| item.item_id == 1849}
  end

  def find_by_invoice_id(input)
    invoice_items.detect { |item| item.invoice_id == 1}
  end

  def find_by_quantity(input)
    invoice_items.detect { |item| item.quantity == 4}
  end

  def find_by_unit_price(input)
    invoice_items.detect { |item| item.unit_price == 34423}
  end

  def find_by_created_at(input) #test not very robust because many invoice_items have the same created at stamp
    invoice_items.detect { |item| item.created_at == "2012-03-27 14:54:10 UTC"}
  end

  def find_by_updated_at(input) #test not very robust because many invoice_items have the same updated at stamp
    invoice_items.detect { |item| item.updated_at =="2012-03-27 14:54:11 UTC"}
  end

  # def find_all_by_id(input)
  #   invoice_items.select { |item| item.id == 86}
  # end

end
