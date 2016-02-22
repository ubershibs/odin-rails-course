class Passenger < ActiveRecord::Base
  has_many :bookings, through: :passenger_bookings
  has_many :passenger_bookings
  has_many :flights, through: :bookings

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX }
end
