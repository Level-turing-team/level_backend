require 'rails_helper'

RSpec.describe 'Api::V1::Photos Discover Index', type: :request do
  before :each do
    @profile = create(:profile)
    @gallery = Gallery.create(user_id: @profile.user_id, name: 'gallery 1', photo_url: 'http://www.google.com', created_at: Time.now, updated_at: Time.now)
    @photos = create_list(:photo, 5, gallery_id: @gallery.id)
    @profile2 = create(:profile)
    @gallery2 = Gallery.create(user_id: @profile2.user_id, name: 'gallery 1', photo_url: 'http://www.google.com', created_at: Time.now, updated_at: Time.now)
    @photos2 = create_list(:photo, 5, gallery_id: @gallery2.id)
  end

  describe 'happy path' do
    it 'should return first 50 (or less) photos from our db' do
      get api_v1_discover_photo_index_path

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].class).to eq(Array)

      expect(json[:data][0][:type]).to eq('photo')
      expect(json[:data][0][:attributes]).to have_key(:description)
      expect(json[:data][0][:attributes]).to have_key(:url)
      expect(json[:data][0][:attributes]).to have_key(:created_at)
      expect(json[:data][0][:attributes]).to have_key(:updated_at)
      expect(json[:data][0][:attributes]).to have_key(:gallery_id)
    end
  end
end
