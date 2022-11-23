class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def index
    @products = Product.all
    @markers = @products.geocoded.map do |product|
    {
      lat: product.latitude,
      lng: product.longitude,
      info_window: render_to_string(partial: "info_window", locals: {product: product})
    }
    end
  end

  def show
    @booking = Booking.new
    @product = Product.where(id: params[:id])
    @markers = @product.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "info_window", locals: { product: product })
      }
    end
  end

  def new
    @product = Product.new
  end

  private

def set_product
  @producte = Product.find(params[:id])
end
  def product_params
    params.require(:product).permit(:name, :description, :address, :state, :photo)
  end
end
