require 'rails_helper'

RSpec.describe 'Api::V1:Gallery Create', type: :request do
  before :each do
    @profile = create(:profile)
  end

  describe 'happy path' do
    it 'should return a 201 when given valid attributes' do
      img = fixture_file_upload('spec/fixture vcr_cassettes/fluff.jpg','img/jgp')
      valid_params = {
                        user_id: @profile.user_id,
                        name: 'gallery 1',
                        created_at: Time.now,
                        updated_at: Time.now,
                        photo_description: "fluff",
                        file: img
                      }

      post api_v1_new_gallery_path(@profile.user_id), params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(201)
      expect(json[:data]).to eq('gallery created successfully')
    end
  end

  describe 'sad path' do
    it 'should return 400 for invalid params' do
      invalid_params = {
                        user_id: @profile.user_id,
                        name: 'gallery 1',
                        created_at: Time.now,
                        updated_at: Time.now
                      }

      post api_v1_new_gallery_path(@profile.user_id), params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
    end

    it 'should return 400 for invalid user/profile' do
      valid_params = {
                        user_id: @profile.user_id,
                        name: 'gallery 1',
                        photo_url: 'http://www.google.com',
                        created_at: Time.now,
                        updated_at: Time.now
                      }

      post api_v1_new_gallery_path('NOPE'), params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
