class Gallery < ApplicationRecord
  has_many :photos

  has_one_attached :feature

  #after feature => , service: :s3

  validates :name, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
