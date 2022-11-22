class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def product_params
    params.require(:product).permit(:name, :description, :address, :state, :photo)
  end
end
