require 'rails_helper'

RSpec.describe 'Api::V1::Profile Near Me', type: :request do
  before :each do
    db_dump
  end

  describe 'happy path' do
    it 'should return profiles of users near me' do
      get api_v1_near_me_path(@profile1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].size).to eq(4)

      expect(json[:data][0][:type]).to eq('profile')
      expect(json[:data][0][:attributes]).to have_key(:zipcode)
      expect(json[:data][0][:attributes]).to have_key(:user_id)
      expect(json[:data][0][:attributes]).to have_key(:profile_picture)
      expect(json[:data][0][:attributes]).to have_key(:username)
    end
  end

  describe 'sad path' do
    it 'should return 400 if the user/profile is not valid' do
      get api_v1_near_me_path('800508')

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
