class Profile < ApplicationRecord
  validates :zipcode, presence: true
  validates :user_id, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
end
