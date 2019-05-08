class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.integer :operation, null: false
      t.datetime :datetime, null: false
      t.float :value, null: false
      t.string :cpf, null: false
      t.string :card, null: false
      t.integer :shop_id, null: false

      t.timestamps
    end
  end
end
