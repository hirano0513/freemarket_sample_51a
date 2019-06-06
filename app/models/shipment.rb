class Shipment < ApplicationRecord
  belongs_to_active_hash :prefectures
  belongs_to :item
end
