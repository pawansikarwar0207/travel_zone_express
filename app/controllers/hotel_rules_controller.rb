class HotelRulesController < ApplicationController
	before_action :set_hotel
  before_action :set_hotel_rules, only: [:edit, :update, :destroy]

  def index
    @hotel_rules = @hotel.hotel_rules
  end

  def new
    @hotel_rule = @hotel.hotel_rules.build
  end

  def create
    @hotel_rule = @hotel.hotel_rules.build(service_params)
    if @hotel_rule.save
      redirect_to hotel_hotel_rules_path(@hotel), notice: 'Hotel rules was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hotel_rule.update(service_params)
      redirect_to hotel_hotel_rules_path(@hotel), notice: 'Hotel rules was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @hotel_rule.destroy
    redirect_to hotel_hotel_rules_path(@hotel), notice: 'Hotel rules was successfully deleted.'
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_hotel_rules
    @hotel_rule = @hotel.hotel_rules.find(params[:id])
  end

  def service_params
    params.require(:hotel_rule).permit(:name, :description)
  end
end
