class MenusController < ApplicationController
  before_action :set_restaurant
  skip_before_filter :verify_authenticity_token

  def create
    #@menu = @restaurant.menus.create(menu_params)
    @menu = Menu.create(restaurant_id: @restaurant.id, name: menu_params[:name], description: menu_params[:description])
    #redirect_to restaurant_path
    render "restaurants/show"
  end

  def destroy
    @menu= Menu.find(params[:id]).destroy
  end



  private
  def set_restaurant
    @restaurant= Restaurant.find(params[:restaurant_id])
  end

  def menu_params
    params.permit(:name, :description)
  end
end
