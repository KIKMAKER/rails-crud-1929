class RestaurantsController < ApplicationController
 before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
#  before_action :set_restaurant, except: [:index, :new, :create]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    # get request to load a form with an empty restaurant instance
    @restaurant = Restaurant.new
  end

  def create
    # post request to submit the user input into the DB
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
