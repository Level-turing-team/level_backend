require 'rails_helper'

RSpec.describe 'Api::V1::Zipcode', type: :request do
  describe 'happy path' do
    it "should give us a 200 when two zipcodes are given" do
      @profile_1 = create(:profile, zipcode: '80123')
      @profile_2 = create(:profile, zipcode: '80125')
      valid_params = {
        current_user: @profile_1.user_id,
        user: @profile_2.user_id
      }
      get api_v1_distance_path, params: valid_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json.class).to eq(Hash)
      expect(json[:data]).to eq(9.58)
    end
  end
end
