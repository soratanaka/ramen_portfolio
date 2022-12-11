class Shop < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :place_id, presence: true
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
end
