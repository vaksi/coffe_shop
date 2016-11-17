class AddFieldCondimentFee < ActiveRecord::Migration
  def change
    add_column :condiments, :fee, :decimal
  end
end
