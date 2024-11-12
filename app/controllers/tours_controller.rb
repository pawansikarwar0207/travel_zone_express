class ToursController < ApplicationController
  before_action :set_tour, only: [:edit, :show, :update, :destroy]
  
  def index
    @tours = Tour.all.order(created_at: :desc)
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to tours_path, notice: 'Tour is created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @tour.update(tour_params)
      redirect_to tours_path, notice: 'Tour is updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @tour.destroy
      redirect_to tours_path, alert: 'Tour is deleted successfully.'
    end
  end

  private 

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :description, :hours, :image, :average_rating)
  end
end
