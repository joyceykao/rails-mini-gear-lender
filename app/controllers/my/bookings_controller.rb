class My::BookingsController < ApplicationController
  def index
    @items = current_user.items
  end

  def update
    set_booking
    @booking.update(set_params)
    redirect_to my_bookings_path
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:total_price, :start_day, :end_day, :user_id, :item_id)
  end

end
