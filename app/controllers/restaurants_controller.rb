class RestaurantsController < ApplicationController

  before_action :restaurant_id, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: '** Restaurant created **'
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: '** Restaurant was successfully updated **'
    else
      render new
    end
  end

  private

  def restaurant_id
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
