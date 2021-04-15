require 'rails_helper'

RSpec.describe 'Api::V1::Posts CirclePost', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @profile_3 = create(:profile)
    @posts = create_list(:post, 10, user_id: @profile_2.user_id)
    Circle.create(user_id: @profile_1.user_id, following_id: @profile_2.user_id)
    Circle.create(user_id: @profile_1.user_id, following_id: @profile_3.user_id)
  end

  describe "happy path" do
    it 'returns a 200 status and json response with circle posts' do
      get api_v1_circle_posts_path(@profile_1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(10)

      expect(json[:data][0][:type]).to eq('post')
      expect(json[:data][0][:attributes]).to have_key(:content)
      expect(json[:data][0][:attributes]).to have_key(:link)
      expect(json[:data][0][:attributes][:user_id]).to eq(@profile_2.user_id)
    end

    it 'returns data as an empty array if profile has no posts' do
      get api_v1_circle_posts_path(@profile_2.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(0)
    end
  end

  describe 'sad path' do
    it 'should return 400 if the profile is invalid' do
      get api_v1_circle_posts_path("NOPE")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
