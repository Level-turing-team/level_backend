require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do 
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :zipcode }
    it { should validate_uniqueness_of :user_id }
  end
end
