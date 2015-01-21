require_relative 'transaction'

class TransactionRepository

  attr_reader :transactions

  def initialize(filename)
    from_csv(filename)
  end

  def from_csv(filename)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    @transactions = rows.map {|row| Transaction.new(row)}
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
    transactions.detect { |transaction| transaction.credit_card_number == input}
  end

  def find_by_credit_card_expiration_date(input) #No expiration dates available in csv file
    transactions.detect { |transaction| transaction.credit_card_expiration_date == input}
  end

  def find_by_result(input) #test not very robust because many transactions have the same result
    transactions.detect { |transaction| transaction.result == input}
  end

  def find_by_created_at(input) #test not very robust because many transactions have the same created at stamp
    transactions.detect { |transaction| transaction.created_at == input}
  end

  def find_by_updated_at(input) #test not very robust because many transactions have the same updated at stamp
    transactions.detect { |transaction| transaction.updated_at == input}
  end

  # def find_all_by_id(input)
  #   transactions.select { |transaction| transaction.id == }
  # end

end
