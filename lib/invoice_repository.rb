require 'pry'
require_relative 'invoice_parser'

class InvoiceRepository
  attr_accessor :invoices,
                :file,
                :engine

  def initialize(filename, engine)
    @file = filename
    @engine = engine
    parse
  end

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

  def parse
    parser = InvoiceParser.new(file, engine)
    @invoices = parser.parse
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(number)
    invoices.detect {|invoice| invoice.id.to_i == number.to_i}
  end

  def find_by_customer_id(number)
    invoices.detect {|invoice| invoice.customer_id.to_i == number.to_i}
  end

  def find_by_merchant_id(number)
    invoices.detect {|invoice| invoice.merchant_id.to_i == number.to_i}
  end

  def find_by_status(input)
    invoices.detect {|invoice| invoice.status == input}
  end

  def find_by_created_at(date)
    invoices.detect {|invoice| invoice.created_at == date}
  end

  def find_by_updated_at(date)
    invoices.detect {|invoice| invoice.updated_at == date}
  end

  def find_all_by_id(number)
    invoices.select {|invoice| invoice.id.to_i == number.to_i}
  end

  def find_all_by_customer_id(number)
    invoices.select {|invoice| invoice.customer_id.to_i == number.to_i}
  end

  def find_all_by_merchant_id(number)
    invoices.select {|invoice| invoice.merchant_id.to_i == number.to_i}
  end

  def find_all_by_status(input)
    invoices.select {|invoice| invoice.status == input}
  end

  def find_all_by_created_at(date)
    invoices.select {|invoice| invoice.created_at == date}
  end

  def find_all_by_updated_at(date)
    invoices.select {|invoice| invoice.updated_at == date}
  end

end
