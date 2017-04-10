class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @restaurants = Restaurant.all
    @restaurant_search_name = Restaurant.search_by_name(params[:search])
    @restaurant_search_locality = Restaurant.search_by_locality(params[:search])

  end

  def show

    #respond_to do |format|
    # format.html  {redirect_to restaurant_path}
    #format.json { render json: @restaurant }
    #end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurants_path, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_path, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :ratings, :locality)
  end
end
