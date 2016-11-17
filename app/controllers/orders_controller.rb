class OrdersController < ApplicationController
  def checkout
    @order = current_order
    @order_items = current_order.order_items
  end
  def update
    @order = current_order
    @order.update_attributes(order_params)
    session.clear
    redirect_to '/cart'
  end
  private
  def order_params
    params.require(:order).permit(:customer_name, :customer_email, :customer_phone, :take_away_at, :price_id, :payment_method, :payment_total, :status)
  end
end
