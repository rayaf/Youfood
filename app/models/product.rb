class Product < ApplicationRecord
  belongs_to :product_category

  has_one_attached :image
  
  has_many :order_products

  validates_associated :product_category
  validates :name, :price, presence: true
end
