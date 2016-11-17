class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :price
  belongs_to :type
  belongs_to :size
  belongs_to :menu
  has_many :order_condiments, dependent: :destroy

  before_save :finalize

  def condiment_total
    order_condiments.collect { |oc| oc.valid? ? (oc.condiment.fee) : 0 }.sum
  end

  def unit_price
    price.fee
  end

  def total_price
    unit_price * quantity
  end

  private

  def finalize
    self[:price_total] = quantity * unit_price + condiment_total
    price_total = self[:price_total]
  end
end

