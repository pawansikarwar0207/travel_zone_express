class Viewpoint < ApplicationRecord
  belongs_to :tour
  validates :name, :description, presence: true
end
