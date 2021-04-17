require 'rails_helper'

RSpec.describe 'Api::V1::Tag Index', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @tag1 = Tag.create(name: 'artist')
    @tag2 = Tag.create(name: 'sculptor')
    ProfileTag.create(user_id: @profile_1.user_id, tag_id: @tag1.id)
    ProfileTag.create(user_id: @profile_1.user_id, tag_id: @tag2.id)
  end

  describe "Happy Path" do
    it "should return all tags belongs to the profile" do
      get api_v1_tags_index_path(@profile_1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json.class).to eq(Hash)
      expect(json[:data].size).to eq(2)
      expect(json[:data][0][:type]).to eq('tag')
      expect(json[:data][0][:attributes]).to have_key(:name)
    end

    it "should return empty array if profile have no tags" do
      get api_v1_tags_index_path(@profile_2.user_id)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data]).to eq([])
    end
  end

  describe 'sad path' do
    it 'returns a 400 if the profile can not be found' do
      get api_v1_tags_index_path("NOPE")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
    end
  end
end
