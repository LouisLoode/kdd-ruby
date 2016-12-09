class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :score

      t.timestamps
    end
    add_index :rates, :user_id
    add_index :rates, :post_id
    add_index :rates, [:user_id, :post_id], unique: true
  end
end
