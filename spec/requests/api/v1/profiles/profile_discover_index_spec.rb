require 'rails_helper'

RSpec.describe 'Api::V1::Profile Index', type: :request do
  before :each do
    db_dump
  end

  describe 'happy path' do
    it 'returns a profile by name search' do
      get api_v1_profile_search_path, params: {tag: "musician" }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      require "pry"; binding.pry
      expect(json[:data].class).to eq(Hash)

      expect(json[:data][:type]).to eq('profile')
      expect(json[:data][:attributes][:user_id]).to eq(@profile_1.user_id)
      expect(json[:data][:attributes]).to have_key(:zipcode)
      expect(json[:data][:attributes]).to have_key(:profile_picture)
    end

    it 'returns a profile by distance search' do
      get api_v1_profile_search_path

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].class).to eq(Hash)

      expect(json[:data][:type]).to eq('profile')
      expect(json[:data][:attributes][:user_id]).to eq(@profile_1.user_id)
      expect(json[:data][:attributes]).to have_key(:zipcode)
      expect(json[:data][:attributes]).to have_key(:profile_picture)
    end

    it 'returns a profile by tag' do
      get api_v1_profile_search_path

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
    it 'returns a 400 if none of the paramters match' do
      get api_v1_profile_show_path("BAD ID")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
