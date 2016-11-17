class Admin::PricesController < ApplicationController
  def index
    @prices = Price.all
    @price = Price.new
  end

  def update
    @price = Price.find(params[:id])
    @price.update(price_params)
    redirect_to admin_prices_path
  end

  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    redirect_to admin_prices_path
  end

  def create
    @price= Price.new(price_params)
    @price.save
    redirect_to admin_prices_path
  end
  private
  def price_params
    params.require(:price).permit(:size_id, :fee, :menu_id)
  end
end
