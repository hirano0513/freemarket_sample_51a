class Item < ApplicationRecord
  has_many :images
  has_many :items_categories
  has_many :categories, through: :items_categories
  belongs_to :user
  belongs_to :shipment
  belongs_to :brand
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  enum item_status: {"---": "","新品、未使用": 1, "未使用に近い": 2,"目立った傷や汚れなし": 3,"やや傷や汚れあり": 4,"傷や汚れあり": 5, "全体的に状態が悪い": 6}, _suffix: true
end
