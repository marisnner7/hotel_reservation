require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:checkin_date) }
    it { is_expected.to validate_presence_of(:checkout_date) }
    it { is_expected.to validate_presence_of(:booking_status) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:room) }
  end

  describe "total_price" do
    it "returns the total price of the booking" do
      booking = create(:booking)
      expect(booking.total_price).to eq(checkin_date - checkout_date).to_i * room.price)
    end
  end

end