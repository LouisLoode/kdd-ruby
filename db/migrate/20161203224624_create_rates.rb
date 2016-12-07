class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
