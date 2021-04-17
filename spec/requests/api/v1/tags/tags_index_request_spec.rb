require 'rails_helper'

RSpec.describe 'Api::V1::Tags', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @profile_3 = create(:profile)
    @posts = create_list(:post, 10, user_id: @profile_2.user_id)
    @tag_1 = create(:tag, name: 'musician')
    @tag_2 = create(:tag, name: 'sculptor')
    @tag_3 = create(:tag, name: 'photographer')
    @tag_4 = create(:tag, name: 'painter')
    ProfileTag.create!(user_id: @profile_1.user_id, tag_id: @tag_1.id)
    ProfileTag.create!(user_id: @profile_1.user_id, tag_id: @tag_2.id)
    ProfileTag.create!(user_id: @profile_1.user_id, tag_id: @tag_3.id)
    ProfileTag.create!(user_id: @profile_1.user_id, tag_id: @tag_4.id)
    Circle.create(user_id: @profile_1.user_id, following_id: @profile_2.user_id)
    Circle.create(user_id: @profile_1.user_id, following_id: @profile_3.user_id)
  end

  describe "happy path" do
    it 'returns a 200 status and json response with circle posts' do
      get api_v1_tags_index_path(@profile_1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(4)
      expect(json[:data][0][:type]).to eq('tag')
      expect(json[:data][0][:attributes]).to have_key(:name)
      expect(json[:data][0][:attributes][:name]).to eq("musician")
      expect(json[:data][0][:id].to_i).to eq(@tag_1.id)
    end

    it 'returns data as an empty array if profile has no tags' do
      get api_v1_tags_index_path(@profile_2.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(200)
      expect(json[:data].length).to eq(0)
    end
  end

  describe 'sad path' do
    it 'should return 400 if the profile is invalid' do
      get api_v1_tags_index_path("NOPE")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
