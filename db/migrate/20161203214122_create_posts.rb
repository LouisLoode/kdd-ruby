class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :url
      t.text :message
      t.integer :cat_id
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
