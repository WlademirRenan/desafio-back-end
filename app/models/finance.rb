class Finance < ApplicationRecord
  enum operation: [:null, :debit, :bill, :financiament, :credit, :loan, :sell, :ted, :doc, :rent]
end
