class Gallery < ApplicationRecord
  has_many :photos

  validates :name, presence: true
  validates :photo_url, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
