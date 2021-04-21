require 'rails_helper'

RSpec.describe 'Api::V1::Gallery Destroy', type: :request do
  before :each do
    @profile = create(:profile)
    @gallery = Gallery.create(user_id: @profile.user_id, name: 'gallery 1', photo_url: 'http://www.google.com', created_at: Time.now, updated_at: Time.now)
  end

  describe 'happy path' do
    it 'should return a 200 given a valid gallery' do
      delete api_v1_gallery_destroy_path(@profile.user_id, @gallery.id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data]).to eq('gallery deleted successfully')
    end
  end

  describe 'sad path' do
    it 'should return record invalid if it cant find profile or gallery' do
      delete api_v1_gallery_destroy_path(@profile.user_id, '0000000')
      
      expect(response).to have_http_status(400)
    end
  end
end
