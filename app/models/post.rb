class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :shop
  has_many :nices, dependent: :destroy
  has_many :nice_users, through: :favorites, source: :user
  validates :content, presence: true
end
