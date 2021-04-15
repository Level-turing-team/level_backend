class Gallery < ApplicationRecord
  belongs_to :user, foreign_key: 'user_google_id', primary_key: 'google_id'
  has_many :photos

  validates :name, presence: true
end
