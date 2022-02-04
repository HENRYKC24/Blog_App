class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.string :text, null: false
      t.integer :comments_counter, default: 0
      t.integer :likes_counter, default: 0

      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
