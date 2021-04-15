require 'rails_helper'

RSpec.describe 'Api::V1::Users Post', type: :request do
  describe 'happy path' do
    it 'should give us a 201 when a user is created with valid information' do
      valid_params = {
                        first_name: 'Andrew',
                        last_name: 'Johnston',
                        zipcode: '80021',
                        google_id: '1111111',
                        user_name: 'Cool guy'
                      }
      post api_v1_users_path, params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(201)
    end
  end

  describe 'sad path' do
    it 'returns an error message if the user is not created' do
      invalid_params = {
        first_name: '',
        last_name: '',
        zipcode: 80021,
        google_id: '1111111',
        user_name: 'Cool guy'
      }
      post api_v1_users_path, params: invalid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq('invalid parameters')
    end
  end
end
