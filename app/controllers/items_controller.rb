class ItemsController < ApplicationController
  before_action :set_menu

  def create
    @item = @menu.items.create(item_params)
    redirect_to @menu
  end

  def destroy
    @item = menu.item.find(params[:id]).destroy
    rendirect_to @menu
  end

  def show
    @items = Item.search(params[:id])

    respond_to do |format|
      format.html  {redirect_to restaurant_menu}
      format.json { render json: @item }
    end
  end

  private
  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def item_params
    params[:item].permit(:name, :rate, :quantity)
  end


end
