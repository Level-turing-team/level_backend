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

  def self.profiles_by_tag(tag_name, user_id)
    tag = Tag.where('name iLIKE ?', "%#{tag_name}%")
    return [] if tag.empty?
    user_ids = tag.first.profile_tags.pluck(:user_id)
    Profile.where(user_id: user_ids).where.not(user_id: user_id)
  end

  def self.search_by_name(username)
    where('username iLIKE ?', "%#{username}%")
  end

  def tags
    tag_ids = ProfileTag.where(user_id: self.user_id).pluck(:tag_id)
    Tag.find(tag_ids)
  end
end
