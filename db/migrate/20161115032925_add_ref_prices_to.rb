class AddRefPricesTo < ActiveRecord::Migration
  def change
    add_reference :prices, :menu, index: true, foreign_key: true
    add_reference :prices, :size, index: true, foreign_key: true
  end
end
