class HotelServicesController < ApplicationController
	before_action :set_hotel
  before_action :set_service, only: [:edit, :update, :destroy]

  def index
    @hotel_services = @hotel.hotel_services
  end

  def new
    @hotel_service = @hotel.hotel_services.build
  end

  def create
    @hotel_service = @hotel.hotel_services.build(service_params)
    if @hotel_service.save
      redirect_to hotel_hotel_services_path(@hotel), notice: 'Hotel service was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hotel_service.update(service_params)
      redirect_to hotel_hotel_services_path(@hotel), notice: 'Hotel service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hotel_service.destroy
    redirect_to hotel_hotel_services_path(@hotel), notice: 'Hotel service was successfully deleted.'
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_service
    @hotel_service = @hotel.hotel_services.find(params[:id])
  end

  def service_params
    params.require(:hotel_service).permit(:name)
  end
end
