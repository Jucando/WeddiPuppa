class Performance < ApplicationRecord
  belongs_to :user
  has_many :media, :reservations
end
