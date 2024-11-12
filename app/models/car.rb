class Car < ApplicationRecord
  has_one_attached :photo

  validates :name, :brand, :model, :price_per_day, :available, presence: true

  validates :price_per_day, numericality: { greater_than: 0 }, format: { with: /\A\d+(\.\d{1,2})?\z/, message: "must be a valid price" }
end
