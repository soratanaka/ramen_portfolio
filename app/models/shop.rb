class Shop < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :favorites, source: :user
end
