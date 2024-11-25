class DashboardController < ApplicationController
  def index
      @car_count = Car.count
      @flight_count = Flight.count
      @tour_count = Tour.count
      @hotel_count = Hotel.count
  
      # Example data for revenue
      @revenue_data = Booking.group(:category).sum(:total_price)
      @modules = %w[tour flight hotel car event] # Add all module names here
        @disabled_modules = fetch_disabled_modules

        # Example data for revenue (if applicable to your app)
        @revenue_data = Booking.group(:category).sum(:total_price)
  end
  private

  def fetch_disabled_modules
    Rails.logger.debug "Fetching settings for disabled modules"
    @modules ||= %w[tour flight hotel car]
    disabled = Setting.where(name: @modules.map { |m| "#{m}_disabled" }, value: 'true')
                      .pluck(:name).map { |name| name.sub('_disabled', '') }
    Rails.logger.debug "Disabled modules: #{disabled}"
    disabled
  end  
end
