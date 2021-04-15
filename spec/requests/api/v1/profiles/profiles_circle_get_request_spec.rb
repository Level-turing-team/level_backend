require 'rails_helper'

RSpec.describe 'Api::V1::Profiles Circle', type: :request do
  before :each do
    @profile_1 = create(:profile)
    @profile_2 = create(:profile)
    @profile_3 = create(:profile)
    @profile_4 = create(:profile)
    @profile_5 = create(:profile)
    @profile_6 = create(:profile)
    @circle_1 = Circle.create(user_id: @profile_1.user_id, following_id: @profile_2.user_id)
    @circle_2 = Circle.create(user_id: @profile_1.user_id, following_id: @profile_2.user_id)
    @circle_3 = Circle.create(user_id: @profile_1.user_id, following_id: @profile_3.user_id)
    @circle_4 = Circle.create(user_id: @profile_1.user_id, following_id: @profile_4.user_id)
    @circle_5 = Circle.create(user_id: @profile_1.user_id, following_id: @profile_5.user_id)
    @circle_6 = Circle.create(user_id: @profile_2.user_id, following_id: @profile_5.user_id)
    
    # @circles = create_list(:circle, 5, user_id: @profile_1.user_id)
    # binding.pry
    # @circle.each do |following|
    #   create(:circle, following_id: followee.id, user_id: @profile_1.id)
    # end
  end

  describe 'happy path' do
    it 'should return the profiles that make up a profiles circle' do
      get api_v1_profiles_circle_path(@profile_1.user_id)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(200)

      expect(json[:data].length).to eq(5)
      expect(json[:data][0][:type]).to eq('profile')
      expect(json[:data][0][:attributes]).to have_key(:profile_picture)
      expect(json[:data][0][:attributes]).to have_key(:user_id)
      expect(json[:data][0][:attributes]).to have_key(:zipcode)
    end
  end

  describe 'sad path' do
    it 'should return a 400 if the profile cant be found' do
      get api_v1_profiles_circle_path("NOPE")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(400)
      expect(json[:error]).to eq('invalid parameters')
    end
  end
end
