class Admin::SizesController < ApplicationController
  def index
    @sizes = Size.all
    @size = Size.new
  end

  def update
    @size = Size.find(params[:id])
    @size.update(size_params)
    redirect_to admin_sizes_path
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy
    redirect_to admin_sizes_path
  end

  def create
    @size= Size.new(size_params)
    @size.save
    redirect_to admin_sizes_path
  end
  private
  def size_params
    params.require(:size).permit(:name, :category_id)
  end
end
