class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @items = Item.all
    if params[:search].blank?
      @items = Item.all
    else
      @items = Item.where(category: params[:search])
    end
  end

  def search
    if params[:search].blank?
      @results = Item.all
    else
      @results = Item.where(category: params[:search])
    end
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
    @item.user = current_user
    if @item.save
      redirect_to item_path(@item)
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
      redirect_to item_path(@item), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category, :price_per_day, :location, :user_id, photos: [])
  end
end
