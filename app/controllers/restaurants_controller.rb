class RestaurantsController < ApplicationController

  # before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "Restaurant created!"
    else
      render :new, status: :unprocessable_entity # 422
    # No need for app/views/restaurants/create.html.erb
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    # No need for app/views/restaurants/update.html.erb
    # redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy # nothing needs to be passed here, as we are only destroying
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to root_path
  end

  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
