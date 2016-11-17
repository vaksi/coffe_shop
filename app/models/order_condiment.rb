class OrderCondiment < ActiveRecord::Base
  belongs_to :condiment
  belongs_to :order_item
  after_save :finalize
  after_destroy :finalize

  private
  def finalize
    OrderItem.find(self[:order_item_id]).save
  end
end
