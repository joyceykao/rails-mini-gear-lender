class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price_per_day, :location, :user_id)
  end
end
