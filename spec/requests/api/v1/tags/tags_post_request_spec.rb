require 'rails_helper'

RSpec.describe 'Api::V1::Tags Create', type: :request do

  describe "Happy Path" do
    it "should create tag and return status 201" do
      valid_params = {
        name: Faker::Name.name
      }
      post api_v1_tags_create_path, params: valid_params
      expect(response).to have_http_status(201)
    end
  end

  describe "Sad Path" do
    it "should response 400 with empty string" do
      valid_params = {
        name: ''
      }
      post api_v1_tags_create_path, params: valid_params
      expect(response).to have_http_status(400)
    end

    it "should response 400 with 2 letters" do
      valid_params = {
        name: 'IT'
      }
      post api_v1_tags_create_path, params: valid_params
      expect(response).to have_http_status(400)
    end

    it "should response 400 with over 20 letters" do
      valid_params = {
        name: 'This should be over 20 letters'
      }
      post api_v1_tags_create_path, params: valid_params
      expect(response).to have_http_status(400)
    end

    it "should response with a status of 400" do
      post api_v1_tags_create_path
      expect(response).to have_http_status(400)
    end
  end
end
