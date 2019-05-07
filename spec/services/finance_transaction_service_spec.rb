require 'rails_helper'

RSpec.describe FinanceTransactionService, type: :model do
  before(:each) do
    @import = FinanceTransactionService.new(file: File.open("#{Rails.root}/CNAB.txt"))
  end

  context 'when date invalid' do
    it 'error' do
      expect(@import.file).to eq 1
      expect(@import.lines.size).to eq 21
    end
  end

end
