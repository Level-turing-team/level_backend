class User < ApplicationRecord
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Circle'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Circle'
  has_many :followers, through: :following_users

  has_many :posts
end