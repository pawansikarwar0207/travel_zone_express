class ReviewsController < ApplicationController
	before_action :set_hotel
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :check_existing_review, only: [:new, :create]

  def index
    @reviews = @hotel.reviews.includes(:user)
  end

  def new
    @review = @hotel.reviews.build
  end

  def create
    @review = @hotel.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to hotel_reviews_path(@hotel), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to hotel_reviews_path(@hotel), notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to hotel_reviews_path(@hotel), notice: 'Review was successfully deleted.'
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_review
    @review = @hotel.reviews.find(params[:id])
  end

  def check_existing_review
  	if @hotel.reviews.exists?(user_id: current_user.id)
  		redirect_to @hotel, alert: 'You have already reviewed this hotel.'
  	end
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :hotel_id)
  end
end
