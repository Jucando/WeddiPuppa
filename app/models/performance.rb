class Performance < ApplicationRecord
  belongs_to :user
  has_many :media, dependent: :nullify
  has_many :reservations, dependent: :nullify
  validates :category, inclusion: { in: ["Concert", "Danse", "Stand-up", "Painter", "DJ"] }
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  include CloudinaryHelper

  def smart_image_url
    if photo.url.nil?
      "http://guitarhippies.com/wp-content/uploads/2017/11/jazz-guitar.jpg"
    else
      cl_image_path self.photo, height: 300, width: 400, crop: :fill
    end
  end
end
