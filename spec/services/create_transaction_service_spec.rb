require 'rails_helper'

RSpec.describe CreateTransactionService, type: :model do
  before(:each) do
    @transaction = CreateTransactionService.new('3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       ')
  end

  context 'when parse date valid' do
    it 'valid contains' do
      expect(@transaction.type).to eq '3'
      expect(@transaction.date).to eq '20190301'
      expect(@transaction.value).to eq '0000014200'
      expect(@transaction.cpf).to eq '09620676017'
      expect(@transaction.card).to eq '4753****3153'
      expect(@transaction.hour).to eq '153453' 
      expect(@transaction.shop_owner).to eq 'JOÃO MACEDO   ' 
      expect(@transaction.shop_name).to eq 'BAR DO JOÃO       '
    end

    it 'valid size' do
      expect(@transaction.type.size).to eq 1
      expect(@transaction.date.size).to eq 8
      expect(@transaction.value.size).to eq 10
      expect(@transaction.cpf.size).to eq 11
      expect(@transaction.card.size).to eq 12
      expect(@transaction.hour.size).to eq 6
      expect(@transaction.shop_owner.size).to eq 14
      expect(@transaction.shop_name.size).to eq 18
    end
  end

  context 'when invalid dates' do
    it 'type nil' do
      @transaction.type = nil
      @transaction.call
      expect(@transaction.errors).to eq ['tipo é requerido']
    end
    it 'date nil' do
      @transaction.date = nil
      @transaction.call
      expect(@transaction.errors).to eq ['data é requerida']
    end
    it 'value nil' do
      @transaction.value = nil
      @transaction.call
      expect(@transaction.errors).to eq ['valor é requerido']
    end
    it 'cpf nil' do
      @transaction.cpf = nil
      @transaction.call
      expect(@transaction.errors).to eq ['cpf é requerido']
    end
    it 'card nil' do
      @transaction.card = nil
      @transaction.call
      expect(@transaction.errors).to eq ['cartão é requerido']
    end
    it 'hour nil' do
      @transaction.hour = nil
      @transaction.call
      expect(@transaction.errors).to eq ['horário é requerido']
    end
    it 'shop_owner nil' do
      @transaction.shop_owner = nil
      @transaction.call
      expect(@transaction.errors).to eq ['dono da loja é requerido']
    end
    it 'shop_name nil' do
      @transaction.shop_name = nil
      @transaction.call
      expect(@transaction.errors).to eq ['nome da loja é requerido']
    end
  end

end
