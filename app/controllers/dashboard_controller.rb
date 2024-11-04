class DashboardController < ApplicationController
  def index
      @car_count = Car.count
      @flight_count = Flight.count
      @tour_count = Tour.count
      @hotel_count = Hotel.count
  
      # Example data for revenue
      @revenue_data = Booking.group(:category).sum(:total_price)
  end
end
