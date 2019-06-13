class ChangeShipmentIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :items, :shipments
  end
end
