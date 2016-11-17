class Admin::CondimentsController < ApplicationController
  def index
    @condiments = Condiment.all
    @condiment = Condiment.new
  end

  def update
    @condiment = Condiment.find(params[:id])
    @condiment.update(condiment_params)
    redirect_to admin_condiments_path
  end

  def destroy
    @condiment = Condiment.find(params[:id])
    @condiment.destroy
    redirect_to admin_condiments_path
  end

  def create
    @condiment= Condiment.new(condiment_params)
    @condiment.save
    redirect_to admin_condiments_path
  end
  private
  def condiment_params
    params.require(:condiment).permit(:name, :description, :fee, :type_id, :category_id)
  end
end
