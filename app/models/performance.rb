class Performance < ApplicationRecord
  belongs_to :user
  has_many :media, dependent: :nullify
  has_many :reservations, dependent: :nullify
  validates :category, inclusion: { in: ["Concert", "Danse", "Stand-up", "Painter", "DJ"] }
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
