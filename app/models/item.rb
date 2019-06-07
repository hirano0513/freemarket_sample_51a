class Item < ApplicationRecord
  validates :name, length: {maximum: 40}
  
  has_many :images
  has_many :items_categories
  has_many :categories, through: :items_categories
  belongs_to :user
  belongs_to :shipment
  belongs_to :brand
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

  enum size: {"--": 0, "XXS以下": 1, "XS(SS)": 2, "S": 3, "M": 4,"L": 5,"XL(LL)": 6, "2XL(3L)": 7, "3XL(4L)": 8, "4XL(5L)以上": 9,"FREESIZE": 10}, _suffix: true

  enum item_status: {"--": 0,"新品、未使用": 1, "未使用に近い": 2,"目立った傷や汚れなし": 3,"やや傷や汚れあり": 4,"傷や汚れあり": 5, "全体的に状態が悪い": 6}, _suffix: true
end
