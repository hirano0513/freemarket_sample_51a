class Personal < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :prefectures
end
