class CarsController < ApplicationController
  before_action :set_cars, only: [:edit, :update, :destroy, :show, :book]
  before_action :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @cars = Car.where(available: true).order(created_at: :desc) # Show only available cars
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path, notice: 'Car was created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @car.update(car_params)
      redirect_to cars_path, notice: 'Car was updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @car.destroy
      redirect_to cars_path, alert: 'Car was deleted successfully.'
    end
  end

  def book
    if @car.update(available: false)
      redirect_to @car, notice: 'Car successfully booked!'
    else
      render :show, alert: 'Booking failed!'
    end
  end  

  private 

  def authorize_admin
    unless current_user&.admin?
      flash[:alert] = "Only admin users can perform this action."
      redirect_to root_path
    end
  end

  def set_cars
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :brand, :model, :price_per_day, :available, :photo)
  end
    
end
