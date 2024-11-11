class FoodItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_item, only: [:edit, :update, :destroy]

  def index
    @food_items = FoodItem.all
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    if @food_item.save
      redirect_to food_items_path, notice: 'Food item created successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @food_item.update(food_item_params)
      redirect_to food_items_path, notice: 'Food item updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @food_item = FoodItem.find(params[:id])
    @food_item.destroy
    flash[:notice] = 'Food item was successfully deleted.'
    redirect_to food_items_path
  end

  private

  def set_food_item
    @food_item = FoodItem.find(params[:id])
  end

  def food_item_params
    params.require(:food_item).permit(:name, :description, :price, :preparation_time, :photo)
  end
end
