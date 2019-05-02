class Order < ApplicationRecord
  attr_default :status, 0

  belongs_to :restaurant
 
  has_many :order_products

  validates :name, :phone_number, :total_value, presence: true

  accepts_nested_attributes_for :order_products, allow_destroy: true

  before_validation :set_price


  enum status: {
    waiting: 0,
    delivered: 1
  }

  private
   
  def set_price
    @final_price = 0
    order_products.each do |order_product|
      product = Product.find order_product.product_id
      @final_price += order_product.quantity * product.price
    end
    
    self.total_value = @final_price
  end

end
