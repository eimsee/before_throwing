class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def order
    @last_4_products = Product.all.order(created_at: :desc).last(4)
  end
  def home
    @product = Product.first
    @last_4_products = Product.all.order(created_at: :desc).first(4)
    # @address = current_user.address || 'Fort-de-France Martinique'
    @address = 'Fort-de-France Martinique'
    @products = Product.near(@address, 5)
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "products/info_window", locals: { product: product })
      }
    end
  end

  def dashboard
    @my_products = current_user.products.reverse # products que j'ai mis a disposition sur le site
    @my_booked_products = current_user.booked_products.reverse # products que j'ai reservé
  end
end
