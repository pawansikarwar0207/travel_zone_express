class Facility < ApplicationRecord
  belongs_to :hotel

  validates :name, presence: true

  FACILITY = [
    'Flat Tv',
    'Laundry and dry cleaning',
    'Internet – Wifi',
    'Coffee and tea'
  ]
end
