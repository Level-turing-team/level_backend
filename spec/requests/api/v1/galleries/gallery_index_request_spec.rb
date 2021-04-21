require 'rails_helper'

RSpec.describe 'Api::V1::Galleries::Index Get', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @galleries = create_list(:gallery, 5, user_id: @profile_1.user_id, photo_url: 'http://www.google.com')
  end

  describe 'happy path' do
    it 'should return all a profiles galleries with attributes' do
      get api_v1_gallery_index_path(@profile_1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(5)

      expect(json[:data][0][:type]).to eq('gallery')
      expect(json[:data][0][:attributes][:user_id]).to eq(@profile_1.user_id)
      expect(json[:data][0][:attributes]).to have_key(:name)
      expect(json[:data][0][:attributes]).to have_key(:photo_url)
      expect(json[:data][0][:attributes]).to have_key(:created_at)
      expect(json[:data][0][:attributes]).to have_key(:updated_at)
    end

    it 'should return an empty array for data if profile has no galleries' do
      get api_v1_gallery_index_path(@profile_2.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)

      expect(json[:data]).to eq([])
    end
  end

  describe 'sad path' do
    it 'returns 400 if profile does not exist' do
      get api_v1_gallery_index_path("NOPE")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
