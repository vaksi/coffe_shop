class CreateOrderCondiments < ActiveRecord::Migration
  def change
    create_table :order_condiments do |t|
      t.references :condiment, index: true, foreign_key: true
      t.references :order_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
