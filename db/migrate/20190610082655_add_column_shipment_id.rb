class AddColumnShipmentId < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :shipment_id, :integer
  end
end
