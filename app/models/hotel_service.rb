class HotelService < ApplicationRecord
  belongs_to :hotel

  validates :name, presence: true

  HOTEL_SERVICE = [
    'Havana Lobby bar',
    'Fiesta Restaurant',
    'Free luggage deposit',
    'Laundry Services',
    'Tickets'
  ]
end
