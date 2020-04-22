class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  # def index
  #   @user = User.find(@item.user_id)
  #   @bookings = Booking.all
  # end

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.item = @item
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
    redirect_to item_path(@item), notice: 'Booking was successfully deleted.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:total_price, :start_day, :end_day, :user_id, :item_id)
  end
end
