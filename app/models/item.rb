class Item < ApplicationRecord
  has_many :comments
  has_many :images
  has_many :items_categories
  has_many :categories, through: :items_categories
  belongs_to :user
  belongs_to :shipment
  belongs_to :brand
end
