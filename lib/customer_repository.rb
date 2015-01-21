require_relative 'customer'

class CustomerRepository

  attr_reader :customers

  def initialize(filename)
    from_csv(filename)
  end

  def from_csv(filename)
    rows = CSV.open(filename, headers: true, header_converters: :symbol)
    @customers = rows.map {|row| Customer.new(row)}
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_first_name(input) #only finds the first instance of first name
    customers.detect { |customer| customer.first_name == "Grace"}
  end

  def find_by_id(input)
    customers.detect { |customer| customer.id == 86}
  end

  def find_by_last_name(input)
    customers.detect { |customer| customer.last_name == "Flatley"}
  end

  def find_by_created_at(input) #test not very robust because many customers have the same created at stamp
    customers.detect { |customer| customer.created_at == "2012-03-27 14:54:16 UTC"}
  end

  def find_by_updated_at(input) #test not very robust because many customers have the same updated at stamp
    customers.detect { |customer| customer.updated_at =="2012-03-27 14:54:20 UTC"}
  end

  def find_all_by_id(input)
    customers.select { |customer| customer.id == 86}
  end

end
