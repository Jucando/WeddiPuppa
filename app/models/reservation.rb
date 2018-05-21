class Reservation < ApplicationRecord
  belongs_to :performance
  belongs_to :user
  validates :date, presence: true
  validates :location, presence: true
end
