class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :start_day, presence: true
  validates :end_day, presence: true
end
