class FlightsController < ApplicationController
  before_action :set_flight, only: [:edit, :update, :destroy, :show] 

  def index
    @flights = Flight.all.order(created_at: :desc)
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to flights_path, notice: "Flight was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @flight.update(flight_params)
      redirect_to flights_path, notice: "Flight was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @flight.destroy
      redirect_to flights_path, notice: 'Flight was successfully deleted.'
    end
  end
  
  def search
    # Fetch form parameters for searching
    from_location = params[:from_location]
    to_location = params[:to_location]
    depart_date = params[:depart_date]
    return_date = params[:return_date]
    travelers = params[:travelers]
    class_type = params[:class_type]
  
    # Perform flight search based on criteria (add logic here)
    @flights = Flight.where(departure_location: from_location, arrival_location: to_location)
                     .where("take_off_time >= ?", depart_date)
  
    # Add additional filters based on return_date, travelers, class_type
  
    render :index
  end  

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_params
    params.require(:flight).permit(:flight_number, :departure_location, :arrival_location, :take_off_time, :landing_time, :seat_type, :baggage_checkin, :baggage_cabin, :price, :number_of_seats, :logo, :image)
  end
end
