class AddUsersToCreditCard < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :credit_card
  end
end
