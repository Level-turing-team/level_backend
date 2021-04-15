require 'rails_helper'

RSpec.describe 'Api::V1::Posts Index', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)

    @posts = create_list(:post, 10, user_id: @profile_1.user_id)
  end

  describe "Happy Path" do
    it "returns all users posts" do
      get api_v1_posts_path(@profile_1.user_id)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(10)
      expect(json[:data][0][:type]).to eq('post')
      expect(json[:data][0][:attributes]).to have_key(:content)
      expect(json[:data][0][:attributes]).to have_key(:link)
      expect(json[:data][0][:attributes][:user_id]).to eq(@profile_1.user_id)
    end

    it "returns empty data if users has no posts" do
      get api_v1_posts_path(@profile_2.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(0)
    end
  end

  describe "Sad path" do
    it "returns 400 for invalid ID" do
      get api_v1_circle_posts_path("NOPE")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
