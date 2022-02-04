class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.string :photo
      t.string :bio
      t.string :role
      t.integer :posts_counter, default: 0
      t.timestamps
    end
  end
end
