class Finance < ApplicationRecord
  enum type: [:null, :debit, :bill, :financiament, :credit, :loan, :sell, :ted, :doc, :rent]
end
