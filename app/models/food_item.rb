class FoodItem < ApplicationRecord
  has_one_attached :photo
  has_many :orders, through: :order_items
  has_many :order_items, dependent: :destroy
end
