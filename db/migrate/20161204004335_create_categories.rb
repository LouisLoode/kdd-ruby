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
    create_table :posts_categories, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :category, index: true
    end
  end
end
