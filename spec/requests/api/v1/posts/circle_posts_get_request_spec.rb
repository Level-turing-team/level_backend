require 'rails_helper'

RSpec.describe 'Api::V1::Posts CirclePost', type: :request do
  before :each do
    @user_1 = create(:user)
    @posts = create_list(:post, 10, user_google_id: @user_1.google_id)
    @user_2 = create(:user)
  end

  describe "happy path" do
    it 'returns a 200 status and json response with circle posts' do
      get api_v1_circle_posts_path(@user_1.google_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(10)

      expect(json[:data][0][:type]).to eq('post')
      expect(json[:data][0][:attributes]).to have_key(:content)
      expect(json[:data][0][:attributes]).to have_key(:link)
      expect(json[:data][0][:attributes][:user_google_id]).to eq(@user_1.google_id)
    end

    it 'returns data as an empty array if user has no posts' do
      get api_v1_circle_posts_path(@user_2.google_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(0)
    end
  end

  describe 'sad path' do
    it 'should return 400 if the user is invalid' do
      get api_v1_circle_posts_path(21039123012)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
