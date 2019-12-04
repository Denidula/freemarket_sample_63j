class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description, null: false
      t.string :size
      t.string :status, null: false
      t.string :charge, null: false
      t.string :delivery_method, null: false
      t.string :send_date, null: false
      t.integer :prefecture_id, null: false
      t.string :parent_category
      t.string :child_category
      t.string :grandchild_category
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
