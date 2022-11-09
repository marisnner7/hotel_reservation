class Room < ApplicationRecord
  validates :price, presence: true
  validates :description, presence: true
  validates :availability, presence: true

  def cancel
    update_attribute :availability, true
  end
end
