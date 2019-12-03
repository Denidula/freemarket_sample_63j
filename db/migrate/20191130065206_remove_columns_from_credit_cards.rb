class RemoveColumnsFromCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :number, :integer
    remove_column :credit_cards, :limit_month, :integer
    remove_column :credit_cards, :limit_year, :integer
    remove_column :credit_cards, :security_code, :integer
  end
end
