require 'rails_helper'

RSpec.describe 'Api::V1::Users Circle', type: :request do
  before :each do 
    @profile = Profile.create(user_id: 13, zipcode: "80218", profile_picture: "www.google.com")
  end
  describe 'happy path' do
    it 'should return a 201 for valid paramters' do
      valid_params = {
                        content: 'This app is rad af yo',
                        link: 'http://www.google.com',
                        user_id: @profile.user_id
                      }
      post api_v1_profiles_post_path(@profile.user_id), params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
    end
  end

  describe 'sad path' do
    it 'should return a 400 if the user_id is wrong' do
      bad_params = {
        content: 'heres some content',
        link: ''
      }
      post api_v1_profiles_post_path('NOPE'), params: bad_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
    end

    it 'should return a 400 if there is no content for the post' do
      bad_params = {
        link: 'http://www.google.com',
        user_id: @profile.user_id
      }
      post api_v1_profiles_post_path(@profile.user_id), params: bad_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
    end
  end
end
