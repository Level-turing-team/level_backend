class User < ApplicationRecord
  validates :profile_name, presence: true
  validates :zipcode, presence: true
  validates :user_id, presence: true
end
