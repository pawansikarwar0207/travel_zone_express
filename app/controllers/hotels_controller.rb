class HotelsController < ApplicationController
	before_action :set_hotels, only: %i[edit show update destroy]

	def index
		@hotels = Hotel.all
	end

	def new
		@hotel = Hotel.new
	end

	def create
		@hotel = Hotel.new(hotel_params)
		if @hotel.save
			redirect_to hotels_path, notice: "Hotel created successfully."
		else
			render :new
		end
	end

	def edit
	end

	def show
	end

	def update
		if @hotel.update(hotel_params)
			redirect_to hotels_path, notice: "Hotel updated successfully."
		else
			render :edit
		end
	end

	def destroy
		if @hotel.destroy
			redirect_to hotels_path, notice: "Hotel deleted successfully."
		end
	end

	private

	def set_hotels
		@hotel = Hotel.find(params[:id])
	end

	def hotel_params
		params.require(:hotel).permit(:hotel_name, :description, :address, :contact_number, :property_type, :highlights, :price_per_night, images: [])
	end
end
