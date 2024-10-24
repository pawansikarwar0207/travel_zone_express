class Tour < ApplicationRecord
  has_many :viewpoints, dependent: :destroy
  validates :name, :description, :hours, :image, presence: true
end
