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
    transactions.detect { |transaction| transaction.id == 11}
  end


  def find_by_invoice_id(input)
    transactions.detect { |transaction| transaction.invoice_id == 21}
  end

  def find_by_credit_card_number(input)
    transactions.detect { |transaction| transaction.credit_card_number == 4094113568951317}
  end

  def find_by_credit_card_expiration_date(input) #No expiration dates available in csv file
    transactions.detect { |transaction| transaction.credit_card_expiration_date == " "}
  end

  def find_by_result(input) #test not very robust because many transactions have the same result
    transactions.detect { |transaction| transaction.result == "failed"}
  end

  def find_by_created_at(input) #test not very robust because many transactions have the same created at stamp
    transactions.detect { |transaction| transaction.created_at == "2012-03-27 14:54:10 UTC"}
  end

  def find_by_updated_at(input) #test not very robust because many transactions have the same updated at stamp
    transactions.detect { |transaction| transaction.updated_at =="2012-03-27 14:54:11 UTC"}
  end

  # def find_all_by_id(input)
  #   transactions.select { |transaction| transaction.id == }
  # end

end
