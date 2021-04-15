class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :zipcode, presence: true
  validates :google_id, presence: true
  has_one_attached :profile_picture

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Circle'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Circle'
  has_many :followers, through: :following_users

  has_many :posts, foreign_key: 'user_google_id', primary_key: 'google_id'
  has_many :galleries, foreign_key: 'user_google_id', primary_key: 'google_id'

end
