class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    if @order.save
      session[:order_id] = @order.id
      redirect_to '/cart'
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    redirect_to '/cart'
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    redirect_to '/cart'
  end
  private
    def order_item_params
      params.require(:order_item).permit(:quantity, :menu_id, :type_id, :size_id, :price_id)
    end
end
