class Boat < ApplicationRecord
  scope :available_for_rent, -> { where(available: true) }
  has_one_attached :photo

  # You can add validations here, for example:
  validates :name, presence: true
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  validates :passengers, numericality: { only_integer: true, greater_than: 0 }
  validates :crew, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
end
