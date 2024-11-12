class Flight < ApplicationRecord

  validates :flight_number, :departure_location, :arrival_location, :take_off_time, :landing_time, :seat_type, :price, :number_of_seats, presence: true

  validates :flight_number, uniqueness: true

  validates :departure_location, :arrival_location, length: { maximum: 100 }

  # Ensure that take-off time is before landing time
  validate :take_off_must_be_before_landing

  # Validate seat type for allowed values (assuming Economy, Business, and First class as options)
  validates :seat_type, inclusion: { in: %w[Economy Business First], message: "%{value} is not a valid seat type" }

  # Validate that baggage check-in and cabin baggage are specified in an acceptable format (e.g., "1 bag", "2 bags")
  validates :baggage_checkin, :baggage_cabin, format: { with: /\A\d+\sbag(s)?\z/, message: "must be in the format '1 bag' or '2 bags'" }

  # Validate price to be a positive decimal with two decimal places max
  validates :price, numericality: { greater_than: 0 }, format: { with: /\A\d+(\.\d{1,2})?\z/, message: "must be a valid amount" }

  validates :number_of_seats, numericality: { only_integer: true, greater_than: 0 }

  private

  def take_off_must_be_before_landing
    if take_off_time.present? && landing_time.present? && take_off_time >= landing_time
      errors.add(:take_off_time, "must be before landing time")
    end
  end
end
