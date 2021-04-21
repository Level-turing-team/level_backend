require 'rails_helper'

RSpec.describe 'Api::V1::Circles Create', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
  end

  describe 'happy path' do
    it 'creates a new circle relationship when given valid params' do
      post api_v1_circle_create_path(@profile_1.user_id), params: { user_id: @profile_1.user_id, following_id: @profile_2.user_id }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(201)
    end
  end

  describe 'sad path' do
    it 'returns 400 if user id is invalid' do
      post api_v1_circle_create_path('dude'), params: { user_id: @profile_1.user_id, following_id: @profile_2.user_id }
      expect(response.status).to eq(400)
    end

    it 'returns a 400 if following id is invalid' do
      post api_v1_circle_create_path(@profile_1.user_id), params: { user_id: @profile_1.user_id, following_id: 'dude' }
      expect(response.status).to eq(400)
    end
  end
end
