class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :all_available, -> { left_outer_joins(:bookings).where(bookings: {id: nil}) }

  def booked?
    bookings.any?
  end

  def booking
    bookings.first
  end

  def order
    @last_4_products = Product.all.order(created_at: :desc).last(4)
  end
end
