class CarsController < ApplicationController
    def index
      @cars = Car.where(available: true) # Show only available cars
    end
  
    def show
      @car = Car.find(params[:id])
    end
  
    def book
      @car = Car.find(params[:id])
      if @car.update(available: false)
        redirect_to @car, notice: 'Car successfully booked!'
      else
        render :show, alert: 'Booking failed!'
      end
    end  
    def car_params
      params.require(:car).permit(:name, :brand, :model, :price_per_day, :photo)
    end
    
end
