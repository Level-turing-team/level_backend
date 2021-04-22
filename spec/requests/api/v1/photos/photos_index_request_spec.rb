require 'rails_helper'

RSpec.describe 'Api::V1::Photos Index', type: :request do
  before :each do
    @profile = create(:profile)
    @gallery = Gallery.create(user_id: @profile.user_id, name: 'gallery 1', photo_url: 'http://www.google.com', created_at: Time.now, updated_at: Time.now)
    @photos = create_list(:photo, 5, gallery_id: @gallery.id)
    @profile2 = create(:profile)
    @gallery2 = Gallery.create(user_id: @profile2.user_id, name: 'gallery 1', photo_url: 'http://www.google.com', created_at: Time.now, updated_at: Time.now)
  end

  describe 'happy path' do
    it 'should return all photos belonging to given gallery' do
      get api_v1_user_photos_path(@profile.user_id, @gallery.id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].class).to eq(Array)

      expect(json[:data].length).to eq(5)
      expect(json[:data][0][:type]).to eq('photo')
      expect(json[:data][0][:attributes]).to have_key(:description)
      expect(json[:data][0][:attributes]).to have_key(:url)
      expect(json[:data][0][:attributes]).to have_key(:created_at)
      expect(json[:data][0][:attributes]).to have_key(:updated_at)
      expect(json[:data][0][:attributes]).to have_key(:gallery_id)
      expect(json[:data][0][:attributes]).to have_key(:user_id)
    end

    it 'should return empty array for a gallery with no photos' do
      get api_v1_user_photos_path(@profile2.user_id, @gallery2.id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].class).to eq(Array)

      expect(json[:data].length).to eq(0)
    end
  end

  describe 'sad path' do
    it 'should retrun 400 with invalid profile' do
      get api_v1_user_photos_path('0000', @gallery.id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end

    it 'should return 400 with invalid gallery' do
      get api_v1_user_photos_path(@profile.user_id, '50005')

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end

    it 'should return 400 if gallery doesnt belong to profile' do
      get api_v1_user_photos_path(@profile2.user_id, @gallery.id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
