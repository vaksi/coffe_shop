class AddRefCondimentsToCategoryAndType < ActiveRecord::Migration
  def change
    add_reference :condiments, :category, index: true, foreign_key: true
    add_reference :condiments, :type, index: true, foreign_key: true
  end
end
