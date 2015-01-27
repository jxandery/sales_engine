require_relative 'invoice_item'
require_relative 'invoice_item_parser'

class InvoiceItemRepository

  attr_reader :invoice_items,
              :file,
              :engine

  def initialize(filename, engine)
    @file = filename
    @engine = engine
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end
  
  def parse
    parser = InvoiceItemParser.new(file, engine)
    @invoice_items = parser.parse
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(input)
    invoice_items.detect { |item| item.id == input}
  end

  def find_by_item_id(input)
    invoice_items.detect { |item| item.item_id == input}
  end

  def find_by_invoice_id(input)
    invoice_items.detect { |item| item.invoice_id == input}
  end

  def find_by_quantity(input)
    invoice_items.detect { |item| item.quantity == input}
  end

  def find_by_unit_price(input)
    invoice_items.detect { |item| item.unit_price == input}
  end

  def find_by_created_at(input)
    invoice_items.detect { |item| item.created_at == input}
  end

  def find_by_updated_at(input)
    invoice_items.detect { |item| item.updated_at == input}
  end

  def find_all_by_id(input)
    invoice_items.select { |item| item.id == input}
  end

  def find_all_by_item_id(input)
    invoice_items.select { |item| item.item_id == input}
  end

  def find_all_by_invoice_id(input)
    invoice_items.select { |item| item.invoice_id == input}
  end

  def find_all_by_quantity(input)
    invoice_items.select { |item| item.quantity == input}
  end

  def find_all_by_unit_price(input)
    invoice_items.select { |item| item.unit_price == input}
  end

  def find_all_by_created_at(input)
    invoice_items.select { |item| item.created_at == input}
  end

  def find_all_by_updated_at(input)
    invoice_items.select { |item| item.updated_at == input}
  end
end
