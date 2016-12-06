class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :slug
      t.string :biography
      t.string :github
      t.string :website
      t.string :avatar
      t.float :rank
      t.timestamps
    end
    add_index :users, :slug, unique: true
  end
end
