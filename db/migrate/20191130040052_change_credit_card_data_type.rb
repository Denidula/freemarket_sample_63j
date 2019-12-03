class ChangeCreditCardDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :credit_cards, :card_id, :string
    rename_column :credit_cards, :costomer_id, :customer_id
    change_column :credit_cards, :customer_id, :string
  end
end
