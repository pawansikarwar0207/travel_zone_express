class BoatsController < ApplicationController
  before_action :set_boats, only: [:edit, :update, :show, :destroy, :rent, :confirm_rental ]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]


  def index
    @boats = Boat.includes(photo_attachment: :blob)
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to boats_path, notice: 'Boat has been created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @boat = Boat.new
  end

  def show
  end

  def edit
  end

  def update
    if @boat.update(boat_params)
      redirect_to boats_path, notice: 'Boat has been updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @boat.destroy
      redirect_to boats_path, notice: 'Boat has been deleted successfully.'
    end
  end
  
  def rent
    
  end

  def confirm_rental
    if @boat.update(available: false)  # Mark as rented
      redirect_to @boat, notice: "Boat has been successfully rented!"
    else
      render :rent, alert: "There was an issue with renting the boat."
    end
  end

  private
  
  def authorize_admin
    unless current_user&.admin?
      flash[:alert] = "Only admin users can perform this action."
      redirect_to root_path
    end
  end
  
  def set_boats
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :rating, :reviews_count, :passengers, :crew, :price, :description, :manufacturer, :model, :year, :engines, :fuel, :available, :rental_price)
  end
end
