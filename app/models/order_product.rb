class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates_associated :order, :product
  validates :quantity, presence: true
end
