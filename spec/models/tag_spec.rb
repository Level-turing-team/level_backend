require 'rails_helper'

RSpec.describe Tag, type: :model do

  describe "Relationships" do
    it {should have_many :profile_tags}
  end

  describe "Validates" do
    it {should validate_presence_of :name}
    it {should validate_length_of(:name).is_at_least(3)}
    it {should validate_length_of(:name).is_at_most(20)}
  end
end
