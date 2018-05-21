class Performance < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  has_many :media, :reservations
=======
  validates :category, inclusion: { in: ["Concert", "Danse", "Stand-up", "Painter", "DJ"] }
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
>>>>>>> 77e8e725702bd970c4960242747c20a968cbbd2f
end
