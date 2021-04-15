class Post < ApplicationRecord
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :content, presence: true

end
