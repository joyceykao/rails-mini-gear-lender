class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.find(params[:item_id])
    @bookings = Booking.where(user_id: current_user.id)
  end

  def index_as_renter
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @item = @booking.item
  end

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user
    if @booking.end_day && @booking.start_day
      @booking.total_price = (@booking.end_day - @booking.start_day).to_i * @booking.item.price_per_day.to_i / 60000
    else
      @booking.total_price = 0
    end
    if @booking.save
      redirect_to items_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to item_path(@item), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to item_path(@booking.item), notice: 'Booking was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:total_price, :start_day, :end_day, :user_id, :item_id)
  end
end
