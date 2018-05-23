class Reservation < ApplicationRecord
  belongs_to :performance
  belongs_to :user
  validates :date, presence: true
  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
