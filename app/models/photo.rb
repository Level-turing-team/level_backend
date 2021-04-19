class Photo < ApplicationRecord
  belongs_to :gallery
  has_one_attached :photo
  validates :url, presence: true
  validates :description, presence: true
end
