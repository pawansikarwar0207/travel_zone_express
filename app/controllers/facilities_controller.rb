class FacilitiesController < ApplicationController
	before_action :set_hotel
  before_action :set_facility, only: [:edit, :update, :destroy]

  def index
    @facilities = @hotel.facilities
  end

  def new
    @facility = @hotel.facilities.build
  end

  def create
    @facility = @hotel.facilities.build(facility_params)
    if @facility.save
      redirect_to hotel_facilities_path(@hotel), notice: 'Facility was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @facility.update(facility_params)
      redirect_to hotel_facilities_path(@hotel), notice: 'Facility was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @facility.destroy
    redirect_to hotel_facilities_path(@hotel), notice: 'Facility was successfully deleted.'
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_facility
    @facility = @hotel.facilities.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:name)
  end
end
