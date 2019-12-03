class AddColumnsToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :costomer_id, :integer, null: false
    add_column :credit_cards, :card_id, :integer, null: false
  end
end
