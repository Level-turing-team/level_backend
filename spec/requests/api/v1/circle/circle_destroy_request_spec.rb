require 'rails_helper'

RSpec.describe 'Api::V1::Circles Destroy', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @circle_1 = Circle.create(user_id: @profile_1.user_id, following_id: @profile_2.user_id)
  end

  describe 'happy path' do
    it 'should return a 204' do
      delete api_v1_circle_destroy_path(@profile_1), params: { user_id: @profile_1.user_id, following_id: @profile_2.user_id }

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)
      expect(json[:data]).to eq('circle destroyed successfully')
    end
  end
end
