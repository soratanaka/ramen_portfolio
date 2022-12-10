class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :shops
  has_many :nices, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  mount_uploader :avatar, AvatarUploader

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
      user.avatar = nil
      user.plofile = "ゲスト"
      user.name = "ゲストユーザー(一般)"
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
      user.confirmed_at = Time.now￥
      user.avatar = nil
      user.plofile = "ゲスト"
      user.name = "ゲストユーザー(管理者)"
    end
  end
end
