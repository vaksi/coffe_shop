class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menu_params)
    redirect_to admin_menus_path
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_menus_path
  end

  def create
    @menu= Menu.new(menu_params)
    @menu.save
    redirect_to admin_menus_path
  end
  private
  def menu_params
    params.require(:menu).permit(:name, :description, :category_id, :image)
  end
end
