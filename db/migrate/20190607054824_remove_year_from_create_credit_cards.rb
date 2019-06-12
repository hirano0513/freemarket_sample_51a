class RemoveYearFromCreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :year, :integer
    remove_column :credit_cards, :card_number, :integer
    remove_column :credit_cards, :month, :integer
    remove_column :credit_cards, :security_code, :integer
    remove_column :credit_cards, :user_id, :references
  end
end
