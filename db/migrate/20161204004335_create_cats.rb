class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :public
      t.integer :parent_id

      t.timestamps
    end
  end
end
