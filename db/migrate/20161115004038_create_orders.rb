class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status            , default: 'cart'
      t.decimal :payment_total
      t.string :payment_state     , default: 'pending'
      t.string :payment_method
      t.string :delivery          , default: 'take_away'
      t.datetime :take_away_at
      t.string :customer_email
      t.string :customer_name
      t.string :customer_phone
      t.string :customer_address

      t.timestamps null: false
    end
  end
end