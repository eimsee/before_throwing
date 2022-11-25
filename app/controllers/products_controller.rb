class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    if params[:query].present?
      @products = Product.all_available.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @products = Product.all_available
    end
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "info_window", locals: { product: product })
      }
    end
  end

  def show
    @booking = Booking.new
    @products = Product.where(id: params[:id])
    @markers = @products.geocoded.map do |product|
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

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :address, :state, :photo)
  end
end
