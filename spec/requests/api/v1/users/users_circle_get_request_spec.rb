require 'rails_helper'

RSpec.describe 'Api::V1::Users Circle', type: :request do
  before :each do
    @user_1 = create(:user)
    @usercircle = create_list(:user, 5)
    @usercircle.each do |followee|
      create(:circle, followee_id: followee.id, follower_id: @user_1.id)
    end
  end

  describe 'happy path' do
    it 'should return the users that make up a users circle' do
      get api_v1_users_circle_path(@user_1.google_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(json[:data].length).to eq(5)
      expect(json[:data][0][:type]).to eq('user')
      expect(json[:data][0][:attributes]).to have_key(:first_name)
      expect(json[:data][0][:attributes]).to have_key(:last_name)
      expect(json[:data][0][:attributes]).to have_key(:user_name)
      expect(json[:data][0][:attributes]).to have_key(:google_id)
      expect(json[:data][0][:attributes]).to have_key(:zipcode)
    end
  end

  describe 'sad path' do
    it 'should return a 400 if the user cant be found' do
      get api_v1_users_circle_path("NOPE")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq('invalid parameters')
    end
  end
end
