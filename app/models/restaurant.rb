class Restaurant < ApplicationRecord
  geocoded_by :address

  belongs_to :category

  has_one_attached :image
  
  has_many :product_categories
  has_many :orders
  has_many :reviews

  validates_associated :category

  validates :name, :status, :delivery_tax, :city, :street, presence: true

  after_validation :geocode

  enum status: { 
    closed: 0,
    open: 1
  }
 
  
  def address
    [street, number, city, state].compact.join(', ')
  end

end
