class Tag < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {minimum: 3, maximum: 20}, allow_blank: true
  has_many :profile_tags, dependent: :destroy
end
