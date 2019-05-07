class CreateTransactionService

  def initialize(line)
    @type       = line.slice(0, 1) 
    @date       = line.slice(1, 8)
    @value      = line.slice(9, 10)
    @cpf        = line.slice(19, 11)
    @card       = line.slice(30, 12)
    @hour       = line.slice(42, 6)
    @shop_owner = line.slice(48, 14)
    @shop_name  = line.slice(62, 19)
    @errors     = []
  end

  attr_accessor :type, :date, :value, :cpf, :card, :hour, :shop_owner, :shop_name, :errors

  def call

  end
end