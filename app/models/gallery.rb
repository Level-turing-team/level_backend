class Gallery < ApplicationRecord
  has_many :photos, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }


end
