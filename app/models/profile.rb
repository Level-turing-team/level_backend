class Profile < ApplicationRecord
  validates :zipcode, presence: true
  validates :user_id, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }

  def self.friends(user_id)
    where(circles: {user_id: user_id}).joins("INNER JOIN circles ON profiles.user_id = circles.following_id")
  end

  def self.circle_posts(user_id)
    post_ids = friends(user_id).joins('INNER JOIN posts on posts.user_id = profiles.user_id').pluck('posts.id')
    Post.find(post_ids)
  end
end
