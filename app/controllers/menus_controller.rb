class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end
  def show
    @menu = Menu.find(params[:id])
    @order_item = current_order.order_items.new
  end
end
