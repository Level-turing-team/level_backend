require 'rails_helper'

RSpec.describe Circle, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :follower }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :follower_id }
  end
end
