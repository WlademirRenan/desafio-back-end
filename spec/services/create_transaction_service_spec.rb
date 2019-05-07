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

end
