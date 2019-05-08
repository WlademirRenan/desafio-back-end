class Finance < ApplicationRecord
  enum operation: [:null, :debit, :bill, :financiament, :credit, :loan, :sell, :ted, :doc, :rent]

  validates :operation, :datetime, :value, :cpf, :card, :shop_id, presence: true
end
