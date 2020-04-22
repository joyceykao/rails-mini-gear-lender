class Updatebookingdatetodatetime < ActiveRecord::Migration[6.0]
  def change
     change_column :bookings, :start_day, :datetime
     change_column :bookings, :end_day, :datetime
  end
end
