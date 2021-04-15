require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do 
    it { should validate_presence_of :user_id }
    it { should validate_numericality_of(:user_id).only_integer }
    it { should validate_numericality_of(:user_id).is_greater_than(0) }
  end
end
