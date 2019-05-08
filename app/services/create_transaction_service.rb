class CreateTransactionService

  def initialize(line)
    @operation  = line.slice(0, 1) 
    @date       = line.slice(1, 8)
    @value      = line.slice(9, 10)
    @cpf        = line.slice(19, 11)
    @card       = line.slice(30, 12)
    @hour       = line.slice(42, 6)
    @shop_owner = line.slice(48, 14)
    @shop_name  = line.slice(62, 19)
    @errors     = []
  end

  attr_accessor :operation, :date, :value, :cpf, :card, :hour, :shop_owner, :shop_name, :errors

  def call
    validate_fields
    if @errors.empty?
      Finance.create(operation: @operation.to_i, datetime: format_date_time, value: format_value, cpf: @cpf, card: @card, shop_id: get_shop_id)
    end
  end

  def validate_fields
    @errors << 'tipo é requerido' if @operation.blank?
    @errors << 'data é requerida' if @date.blank?
    @errors << 'valor é requerido' if @value.blank?
    @errors << 'cpf é requerido' if @cpf.blank?
    @errors << 'cartão é requerido' if @card.blank?
    @errors << 'horário é requerido' if @hour.blank?
    @errors << 'dono da loja é requerido' if @shop_owner.blank?
    @errors << 'nome da loja é requerido' if @shop_name.blank?
  end

  def get_shop_id
    shop = Shop.where(name: @shop_name.squish, owner: @shop_owner.squish).first_or_create
    shop.id
  end

  def format_value
    @value.to_f / 100.00
  end

  def format_date_time
    "#{@date} #{@hour} -0300"
  end

end