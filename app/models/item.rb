class Item < ApplicationRecord
  validates :name, length: {maximum: 40}
  validates :description, length: {maximum: 1000}
  validates :price, numericality: {only_integer: true,greater_than: 300, less_than: 9999999}
  validates :images, length: {in: 1..10}
  validate :image_type
  
  has_many_attached :images
  has_one :shipment, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  accepts_nested_attributes_for :shipment
  accepts_nested_attributes_for :brand
  has_many :items_categories, dependent: :destroy
  has_many :categories, through: :items_categories

  enum size: {under_XXS: 1, XS: 2, S: 3, M: 4, L: 5, XL: 6, double_XL: 7, triple_XL: 8, over_4XL: 9, FREESIZE: 10}

  enum item_status: {brand_new: 1, near_unused: 2,no_noticeable_scratches: 3, some_scratches: 4, scratches: 5, bad_condition: 6}

  private

    def image_type
      if images.each do |image|
        if !image.content_type.in?(%('image/jpg image/jpeg image/png'))
          errors.add(:images, 'needs to be a JPG or JPEG or PNG')
        end
      end
    end
  end
end
