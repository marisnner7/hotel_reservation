require 'rails_helper'

RSpec.describe Room, type: :model do
  it "has a valid factory" do
    expect(build(:room)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:availability) }
  end

  describe "associations" do
    it { is_expected.to have_many(:bookings) }
  end

  describe "reserved?" do
    it "returns false if the room is available" do
      room = create(:room, availability: false)
      expect(room.reserved?).to eq(true)
    end

    it "returns true if the room is unavailable" do
      room = create(:room, availability: false)
      expect(room.reserved?).to eq(false)
    end

    describe "cancel" do
      it "sets the availability to true" do
        room = create(:room, availability: false)
        room.cancel
        expect(room.availability).to eq(true)
      end
    end
    
  end
end