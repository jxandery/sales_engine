class Merchant
  attr_accessor :id, :name, :created_at, :updated_at
  
  def initialize(data)
    @id = :id
    @name = :name
    @created_at = :created_at
    @updated_at = :updated_at
  end

end
