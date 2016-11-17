class AddFieldPriceTotal < ActiveRecord::Migration
  def change
    add_column :order_items, :price_total, :decimal, default: 0
  end
end
