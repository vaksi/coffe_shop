class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :price
      t.integer :quntity

      t.timestamps null: false
    end
  end
end