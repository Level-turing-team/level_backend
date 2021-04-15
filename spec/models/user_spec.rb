require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :user_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :zipcode }
    it { should validate_presence_of :google_id }
  end

  describe "relationships" do
    it { should have_many :followed_users }
    it { should have_many(:followees).through(:followed_users) }
    it { should have_many :following_users }
    it { should have_many(:followers).through(:following_users) }
    it { should have_many :posts }
  end
end
