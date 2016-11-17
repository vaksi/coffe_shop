class AddRefOrderItemsToMenuSizePriceOrder < ActiveRecord::Migration
  def change
    add_reference :order_items, :menu, index: true, foreign_key: true
    add_reference :order_items, :size, index: true, foreign_key: true
    add_reference :order_items, :price, index: true, foreign_key: true
    add_reference :order_items, :order, index: true, foreign_key: true
  end
end
