class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
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
end
