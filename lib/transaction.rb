require 'pry'
class Transaction

  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration_date,
              :result,
              :created_at,
              :updated_at,
              :engine

  def initialize(data, engine)
    @id = data[:id].to_i
    @invoice_id = data[:invoice_id].to_i
    @credit_card_number = data[:credit_card_number].to_i
    @credit_card_expiration_date = data[:credit_card_expiration_date].to_i
    @result = data[:result]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @engine = engine
  end

  # invoice returns an instance of Invoice associated with this object

  def invoice
    invoices = engine.invoice_repository.parse

    invoices.detect {|invoice| invoice.id == invoice_id}
  end

  def successful?
    result == 'success'
  end
end
