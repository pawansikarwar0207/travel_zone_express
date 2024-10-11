class HotelRule < ApplicationRecord
  belongs_to :hotel

  validates :name, :description, presence: true
end
