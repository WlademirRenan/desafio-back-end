require 'rails_helper'

RSpec.describe Finance, type: :model do
  before(:each) do
    @shop = Shop.create(name: 'loja', owner: 'Joao')
    @finance = Finance.new(operation: 1, datetime: Time.current, value: 1, cpf: '01234567890', card: '1234***12534', shop_id: @shop.id)
  end
  context 'required fields' do
    it 'finance valid' do
      expect(@finance.valid?).to eq true 
    end
    it 'operation nil' do
      @finance.operation = nil
      expect(@finance.valid?).to eq false
    end
    it 'datetime nil' do
      @finance.datetime = nil
      expect(@finance.valid?).to eq false
    end
    it 'value nil' do
      @finance.value = nil
      expect(@finance.valid?).to eq false
    end
    it 'cpf nil' do
      @finance.cpf = nil
      expect(@finance.valid?).to eq false
    end
    it 'card nil' do
      @finance.card = nil
      expect(@finance.valid?).to eq false
    end
    it 'shop_id nil' do
      @finance.shop_id = nil
      expect(@finance.valid?).to eq false
    end
  end
end
