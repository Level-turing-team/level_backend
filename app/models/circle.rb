class Circle < ApplicationRecord
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :following_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
