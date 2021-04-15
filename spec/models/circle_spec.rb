require 'rails_helper'

RSpec.describe Circle, type: :model do
  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :following_id }
  end
end
