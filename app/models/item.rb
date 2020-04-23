class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :description, :category, :price_per_day, :location, presence: true
end
