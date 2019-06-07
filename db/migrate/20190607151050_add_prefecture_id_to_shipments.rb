class AddPrefectureIdToShipments < ActiveRecord::Migration[5.2]
  def change
    add_column :shipments, :prefecture_id, :integer, null: false
  end
end
