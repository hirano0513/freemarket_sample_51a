class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments, id: :integer do |t|
      t.integer :cost_payer, null: false, default: 0
      t.integer :method, null: false, default: 0
      t.integer :days, null: false, default: 0
      t.integer :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
