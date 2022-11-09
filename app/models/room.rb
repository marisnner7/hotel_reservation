class Room < ApplicationRecord
  enum availability: { available: true, unavailable: false }
end
