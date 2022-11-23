class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @product = Product.first
  end

  def dashboard
    @my_products = current_user.products
    @my_booked_products = current_user.booked_products
  end
end
