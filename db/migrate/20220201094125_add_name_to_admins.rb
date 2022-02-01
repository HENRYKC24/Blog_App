class AddNameToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :name, :string
    add_column :admins, :surname, :string
  end
end
