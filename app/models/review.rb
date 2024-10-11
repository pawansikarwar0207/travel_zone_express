class Review < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  # validates :rating, :comment, :user_name, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validates :user_id, uniqueness: { scope: :hotel_id, message: 'can only review a hotel once.' }

end
