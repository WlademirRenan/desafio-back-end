class Finance < ApplicationRecord
  enum type: [:none, :debit, :bill, :financiament, :credit, :loan, :sell, :ted, :doc, :rent]
end
