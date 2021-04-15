class Photo < ApplicationRecord
  belongs_to :gallery

  validates :url, presence: true
end
