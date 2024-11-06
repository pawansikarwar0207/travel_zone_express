class FoodItem < ApplicationRecord
  has_one_attached :photo
  has_many :orders, through: :order_items
end
