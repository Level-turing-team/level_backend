require 'rails_helper'

RSpec.describe 'Api::V1::Profile Index', type: :request do
  before :each do
    db_dump
  end

  describe 'happy path' do
    it 'returns profiles by name search' do
      get api_v1_profile_search_path(@profile1.user_id), params: {name: "boner" }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)

      expect(json[:data].class).to eq(Array)
      expect(json[:data][0][:type]).to eq('profile')
      expect(json[:data][0][:attributes][:user_id]).to eq(@profile5.user_id)
      expect(json[:data][0][:attributes]).to have_key(:zipcode)
      expect(json[:data][0][:attributes]).to have_key(:profile_picture)
    end

    it 'returns a profile by distance search', :vcr do
      get api_v1_profile_search_path(@profile1.user_id), params: { radius: 5 }

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json[:data].class).to eq(Array)
      expect(json[:data].length).to eq(4)
      expect(json[:data][0][:type]).to eq('profile')
      expect(json[:data][0][:attributes][:user_id]).to eq(@profile2.user_id)
      expect(json[:data][0][:attributes]).to have_key(:zipcode)
      expect(json[:data][0][:attributes]).to have_key(:profile_picture)
    end

    it 'returns a profile by tag' do
      get api_v1_profile_search_path(@profile1.user_id), params: { tag: 'musician'}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].class).to eq(Array)

      expect(json[:data].length).to eq(2)
      expect(json[:data][0][:type]).to eq('profile')
      expect(json[:data][0][:attributes][:user_id]).to eq(@profile3.user_id)
      expect(json[:data][0][:attributes]).to have_key(:zipcode)
      expect(json[:data][0][:attributes]).to have_key(:profile_picture)
    end
  end

  describe 'sad path' do
    it 'returns a 400 if none if the user doesnt exist' do
      get api_v1_profile_search_path("BAD ID"), params: { tag: 'musician'}

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end

    it 'returns 400 if there are no params' do
      get api_v1_profile_search_path(@profile1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end

    it 'returns empty data if there are no matches' do
      get api_v1_profile_search_path(@profile1.user_id), params: {name: "epsbcuw" }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data]).to eq([])

      get api_v1_profile_search_path(@profile1.user_id), params: { radius: -1 }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data]).to eq([])

      get api_v1_profile_search_path(@profile1.user_id), params: { radius: 'hello' }
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data]).to eq([])

      get api_v1_profile_search_path(@profile1.user_id), params: { tag: 'regrn'}
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data]).to eq([])
    end
  end
end
