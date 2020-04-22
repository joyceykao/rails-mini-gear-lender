class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      # uncomment below when show method/view is complete
      # redirect_to item_path(@item)
      redirect_to items_path(index)
    else
      render :new
    end
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
