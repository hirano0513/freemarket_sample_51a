class AddUserIdToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :user_id, :integer, null: false
    add_column :credit_cards, :customer_id, :string, null: false
    add_column :credit_cards, :card_id, :string, null: false
  end
end
