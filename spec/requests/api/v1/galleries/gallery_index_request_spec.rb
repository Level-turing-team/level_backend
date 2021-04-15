require 'rails_helper'

RSpec.describe 'Api::V1::Galleries::Index Get', type: :request do
  
  describe 'happy path' do
    before :each do 
      @user_1_id = 3
      post = Post.create(user_id: @user_1_id)
    end
    it "tests the first happy path"
    it "tests the second thing Ian says"
  end
  

  describe 'sad path' do
    it "returns 400 if user doesnt exist "
  end
end
