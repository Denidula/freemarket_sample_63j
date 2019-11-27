class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.integer :limit_month
      t.integer :limit_year
      t.integer :security_code
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
