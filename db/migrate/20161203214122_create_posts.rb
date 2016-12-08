class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :url
      t.text :message
      t.references :user, foreign_key: true
      t.string :og_title
      t.string :og_type
      t.string :og_description
      t.string :og_images
      t.timestamps
    end
    add_index :posts, [:user_id, :created_at]
  end
end
