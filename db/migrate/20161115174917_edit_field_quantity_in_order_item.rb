class EditFieldQuantityInOrderItem < ActiveRecord::Migration
  def change
    rename_column :order_items, :quntity, :quantity
  end
end
