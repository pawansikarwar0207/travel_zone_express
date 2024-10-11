class Room < ApplicationRecord
  belongs_to :hotel

  validates :room_type, :price_per_night, presence: true
end
