class AddImageToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :image, :string, :default => 'portofolio/folio01.jpg'
  end
end
