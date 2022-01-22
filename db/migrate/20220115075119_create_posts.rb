class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.timestamps
      t.references :author, foreign_key: { to_table: 'users' }, null: false
    end
  end
end
