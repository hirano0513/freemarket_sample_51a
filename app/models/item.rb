class Item < ApplicationRecord
  has_many :images
  has_many :items_categories
  has_many :categories, through: :items_categories
  belongs_to :user
  belongs_to :shipment
  belongs_to :brand
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
end
