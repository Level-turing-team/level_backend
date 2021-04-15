class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'user_google_id', primary_key: 'google_id'

  validates :content, presence: true
end
