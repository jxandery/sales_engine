require_relative 'transaction'
require_relative 'transaction_parser'

class TransactionRepository

  attr_reader :transactions,
              :file,
              :engine

  def initialize(filename, engine)
    @file = filename
    @engine = engine
    parse
  end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

  def parse
    parser = TransactionParser.new(file, engine)
    @transactions = parser.parse
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id(input)
    transactions.detect { |transaction| transaction.id == input}
  end


  def find_by_invoice_id(input)
    transactions.detect { |transaction| transaction.invoice_id == input}
  end

  def find_by_credit_card_number(input)
    transactions.detect do |transaction|
      transaction.credit_card_number == input.to_i
    end
  end

  def find_by_credit_card_expiration_date(input)
    transactions.detect do |transaction|
      transaction.credit_card_expiration_date == input
    end
  end

  def find_by_result(input)
    transactions.detect { |transaction| transaction.result == input}
  end

  def find_by_created_at(input)
    transactions.detect { |transaction| transaction.created_at == input}
  end

  def find_by_updated_at(input)
    transactions.detect { |transaction| transaction.updated_at == input}
  end

  def find_all_by_id(input)
    transactions.select { |transaction| transaction.id == input}
  end

  def find_all_by_invoice_id(input)
    transactions.select { |transaction| transaction.invoice_id == input}
  end

  def find_all_by_credit_card_number(input)
    transactions.select { |transaction| transaction.credit_card_number == input}
  end

  def find_all_by_credit_card_expiration_date(input)
    transactions.select do |transaction|
      transaction.credit_card_expiration_date == input
    end
  end

  def find_all_by_result(input)
    transactions.select { |transaction| transaction.result == input}
  end

  def find_all_by_created_at(input)
    transactions.select { |transaction| transaction.created_at == input}
  end

  def find_all_by_updated_at(input)
    transactions.select { |transaction| transaction.updated_at == input}
  end
end
