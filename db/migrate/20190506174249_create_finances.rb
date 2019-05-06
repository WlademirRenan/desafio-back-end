class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.integer :type, null: false
      t.date :datetime, null: false
      t.float :value, null: false
      t.integer :cpf, null: false
      t.string :card, null: false
      t.integer :shop_id, null: false

      t.timestamps
    end
  end
end
