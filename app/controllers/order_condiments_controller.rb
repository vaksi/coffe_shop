class OrderCondimentsController < ApplicationController
  def create
    @order = current_order
    @order_condiment = OrderCondiment.new(order_condiment_params)
    if @order_condiment.save
      session[:order_id] = @order.id
      redirect_to '/cart'
    end
  end

  def update
    @order_condiment = OrderCondiment.find(params[:id])
    @order_condiment.update(order_condiment_params)
    OrderItem.update(order_item: id)
    redirect_to '/cart'
  end

  def destroy
    @order_condiment = OrderCondiment.find(params[:id])
    @order_condiment.destroy
    redirect_to '/cart'
  end
  private
  def order_condiment_params
    params.require(:order_condiment).permit(:condiment_id, :order_item_id)
  end
end
