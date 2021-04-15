require 'rails_helper'

RSpec.describe 'Api::V1::Profile Show', type: :request do
  before :each do
    @profile_1 = create(:profile)
  end

  describe 'happy path' do
    it 'returns a profile with the correct attributes' do
      get api_v1_profile_show_path(@profile_1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].class).to eq(Hash)

      expect(json[:data][:type]).to eq('profile')
      expect(json[:data][:attributes][:user_id]).to eq(@profile_1.user_id)
      expect(json[:data][:attributes]).to have_key(:zipcode)
      expect(json[:data][:attributes]).to have_key(:profile_picture)
    end
  end

  describe 'sad path' do
    it 'returns a 400 if the profile can not be found' do
      get api_v1_profile_show_path("BAD ID")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
