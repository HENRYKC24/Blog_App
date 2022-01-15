class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.string :likes_counter

      t.timestamps
    end
  end
end
