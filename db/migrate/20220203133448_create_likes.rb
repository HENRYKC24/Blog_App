class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :users, null: false, foreign_key: true
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
