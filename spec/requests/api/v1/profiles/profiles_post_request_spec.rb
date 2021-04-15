require 'rails_helper'

RSpec.describe 'Api::V1::Profiles Post', type: :request do
  describe 'happy path' do
    it 'should give us a 201 when a user is created with valid information' do
      valid_params = {
                        zipcode: '80021',
                        user_id: '11111',
                        profile_picture: 'www.google.com'
                      }
      post api_v1_profiles_path, params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
    end
  end

  describe 'sad path' do
    it 'returns an error message if the user is not created' do
      invalid_params = {
        zipcode: 80021,
        user_id: 'A11111',
        profile_picture: 'www.google.com'
      }
      post api_v1_profiles_path, params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq('invalid parameters')
    end
  end
end
