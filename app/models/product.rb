class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :all_available, -> { left_outer_joins(:bookings).where(bookings: {id: nil}) }
end
