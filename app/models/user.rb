class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :performances, dependent: :nullify
  has_many :reservations, dependent: :nullify
  has_many :reservations_as_performer, through: :performances, source: :reservations
end
