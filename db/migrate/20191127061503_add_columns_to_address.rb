class AddColumnsToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :zip_code, :integer, null: false
    add_column :addresses, :city, :string, null: false
    add_column :addresses, :address, :string, null: false
    add_column :addresses, :building, :string
    add_column :addresses, :user_id, :integer, null: false, foreign_key: true
  end
end
