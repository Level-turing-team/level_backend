require 'rails_helper'

RSpec.describe 'Api::V1::Photos Create', type: :request do
  before :each do
    @profile = create(:profile)
    @gallery = Gallery.create(user_id: @profile.user_id, name: 'gallery 1', photo_url: 'http://www.google.com', created_at: Time.now, updated_at: Time.now)
  end

  describe 'happy path' do
    it 'should return a 201 given valid params' do
      valid_params = {
                        description: 'photo 1',
                        url: 'http://www.google.com',
                        created_at: Time.now,
                        updated_at: Time.now
                      }

      post api_v1_new_photo_path(@profile.user_id, @gallery.id), params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(201)
      expect(json[:data]).to eq('photo created successfully')
    end
  end

  describe 'sad path' do
    it 'should return 400 given invalid params' do
      invalid_params = {
                          description: 'photo 1',
                          created_at: Time.now,
                          updated_at: Time.now
                        }

      post api_v1_new_photo_path(@profile.user_id, @gallery.id), params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end

    it 'should return 400 given invalid profile/user' do
      post api_v1_new_photo_path('8090989', @gallery.id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end

    it 'should return 400 given invalid gallery' do
      post api_v1_new_photo_path(@profile.user_id, '80080')

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
