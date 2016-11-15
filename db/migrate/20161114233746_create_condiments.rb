class CreateCondiments < ActiveRecord::Migration
  def change
    create_table :condiments do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
