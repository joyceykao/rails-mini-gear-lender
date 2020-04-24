class UpdateBookingtodate < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :start_day, :date
    change_column :bookings, :end_day, :date
  end
end
