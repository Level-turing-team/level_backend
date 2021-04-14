require 'rails_helper'

RSpec.describe Circle, type: :model do
  describe "relationships" do
    it { should belong_to :followee }
    it { should belong_to :follower }
  end

  describe "validations" do
    it { should validate_presence_of :followee_id }
    it { should validate_presence_of :follower_id }
  end
end
