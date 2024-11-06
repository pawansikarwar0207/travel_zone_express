class FoodItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @food_items = FoodItem.all
  end
end
