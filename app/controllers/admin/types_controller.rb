class Admin::TypesController < ApplicationController
  def index
    @types = Type.all
    @type = Type.new
  end

  def update
    @type = Type.find(params[:id])
    @type.update(type_params)
    redirect_to admin_types_path
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    redirect_to admin_types_path
  end

  def create
    @type= Type.new(type_params)
    @type.save
    redirect_to admin_types_path
  end
  private
  def type_params
    params.require(:type).permit(:name, :category_id)
  end
end
