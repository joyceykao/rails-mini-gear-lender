class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price_per_day, :location, :user_id)
  end
end
