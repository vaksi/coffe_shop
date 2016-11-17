class AddRefTypesCategories < ActiveRecord::Migration
  def change
    add_reference :types, :category, index: true, foreign_key: true
  end
end
