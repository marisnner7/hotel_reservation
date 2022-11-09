class Booking < ApplicationRecord
  belongs_to :room

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validates :booking_status, presence: true


  def total_price
    (checkin_date - checkout_date).to_i * room.price
  end

  def booking_interval
    (checkin_date..checkout_date).to_a
  end

  def can_be_booked?
    @room.bookings.each do |booking|
      return false if (booking.booking_interval & booking_interval).any?
    end
  end
end
