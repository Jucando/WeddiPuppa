class Reservation < ApplicationRecord
  belongs_to :performance
  belongs_to :user
end
