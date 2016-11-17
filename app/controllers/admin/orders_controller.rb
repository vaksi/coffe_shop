class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.order(take_away_at: :desc)
  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end
  def show
    @order = Order.find(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:customer_name, :customer_email, :customer_phone, :take_away_at, :price_id, :payment_method, :payment_total, :status, :payment_state)
  end
end
