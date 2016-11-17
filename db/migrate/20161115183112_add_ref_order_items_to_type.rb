class AddRefOrderItemsToType < ActiveRecord::Migration
  def change
    add_reference :order_items, :type, index: true, foreign_key: true
  end
end
