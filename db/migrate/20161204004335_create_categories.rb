class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :public, :default => false
      t.integer :parent_id

      t.timestamps
    end
  end
end
