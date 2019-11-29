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
      #t.integer :user_id, null: false, foreign_key: true
      #t.integer :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
