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
    validate_fields
    #Finance.create(type: @type, date: @date, value: @value, cpf: @cpf, card: @card)
  end

  def validate_fields
    @errors << 'tipo é requerido' if @type.blank?
    @errors << 'data é requerida' if @date.blank?
    @errors << 'valor é requerido' if @value.blank?
    @errors << 'cpf é requerido' if @cpf.blank?
    @errors << 'cartão é requerido' if @card.blank?
    @errors << 'horário é requerido' if @hour.blank?
    @errors << 'dono da loja é requerido' if @shop_owner.blank?
    @errors << 'nome da loja é requerido' if @shop_name.blank?
  end

end