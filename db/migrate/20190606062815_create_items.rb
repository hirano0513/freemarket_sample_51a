class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer do |t|
      t.string :name, index: true, null: false
      t.integer :price, null: false
      t.integer :size, null: false, default: 0
      t.integer :item_status,null: false, default: 0
      t.integer :sales_status, null: false, default: 0
      t.integer :like
      t.integer :seller_id, null: false,foreign_key: true
      t.integer :buyer_id, null: false,foreign_key: true
      t.integer :brand_id, foreign_key: true
      t.timestamps
    end
  end
end
