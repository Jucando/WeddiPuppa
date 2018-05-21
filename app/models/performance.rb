class Performance < ApplicationRecord
  belongs_to :user
  has_many :media
  has_many :reservations
  validates :category, inclusion: { in: ["Concert", "Danse", "Stand-up", "Painter", "DJ"] }
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
