class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  #変更後の型
  def up
    change_column :items, :buyer_id, :integer, foreign_key: true
  end

  #変更前の型
  def down
    change_column :items, :buyer_id, :integer, null: false,foreign_key: true
  end
end
