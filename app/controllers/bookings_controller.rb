class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @booking.product = @product
    @booking.user = current_user
    if @booking.save
      redirect_to product_path(@product)
    else
      render 'products/show'
    end
  end

  def booking_params
    params.require(:booking).permit(:date, :message)
  end
end
