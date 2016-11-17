class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.price_total) : 0 }.sum
  end
  private
  def update_subtotal
    self[:payment_total] = subtotal
  end
end
