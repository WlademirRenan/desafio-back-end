class Shop < ApplicationRecord
  has_many :finances, class_name: "Finance", foreign_key: "shop_id"
  has_many :finances_in, -> { where operation: [1,4,5,6,7,8] }, class_name: "Finance", foreign_key: "shop_id"
  has_many :finances_out, -> { where operation: [2,3,9] }, class_name: "Finance", foreign_key: "shop_id"

  def calculate_total
    finances_in.pluck(:value).inject(0, :+) - finances_out.pluck(:value).inject(0, :+)
  end
end