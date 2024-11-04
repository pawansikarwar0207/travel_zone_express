class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end
  
  def rent
    @boat = Boat.find(params[:id])
  end

  def confirm_rental
    @boat = Boat.find(params[:id])
    if @boat.update(available: false)  # Mark as rented
      redirect_to @boat, notice: "Boat has been successfully rented!"
    else
      render :rent, alert: "There was an issue with renting the boat."
    end
  end
end
