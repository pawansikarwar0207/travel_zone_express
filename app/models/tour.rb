class Tour < ApplicationRecord
  has_many :viewpoints, dependent: :destroy
  validates :name, :description, :hours, presence: true
end
