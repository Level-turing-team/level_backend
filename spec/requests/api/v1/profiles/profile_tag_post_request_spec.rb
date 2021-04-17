require 'rails_helper'
RSpec.describe "Api::V1::Tags profile_tags create", type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @tag1 = Tag.create(name: 'artist')
    @tag1 = Tag.create(name: 'painter')
  end

  describe "Happy Path" do
    it "should create profile_tag status 201" do
      valid_params = {
        user_id: @profile_1.user_id,
        tag_id: @tag1.id
      }
      post api_v1_tags_user_create_path(@profile_1.user_id), params: valid_params
      expect(response).to have_http_status(201)
    end
  end

  describe 'sad path' do
    it 'should return a 400 if the user_id is wrong' do
      bad_params = {
        tag_id: @tag1.id
      }
      post api_v1_tags_user_create_path('NOPE'), params: bad_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
    end

    it 'should return a 400 if there is no tag' do
      bad_params = {
        user_id: @profile_1.user_id
      }
      post api_v1_tags_user_create_path(@profile_1.user_id), params: bad_params

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
    end
  end
end
