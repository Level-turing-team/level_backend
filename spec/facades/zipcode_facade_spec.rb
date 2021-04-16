require 'rails_helper'

RSpec.describe ZipcodeFacade, type: :model do
  before :each do
    @profile_1 = create(:profile, zipcode: '80123')
    @profile_2 = create(:profile, zipcode: '80125')
  end

  describe "#distance_between" do
    it "should get distance between two zipcodes", :vcr do
      result = ZipcodeFacade.distance_between(@profile_1.zipcode, @profile_2.zipcode)
      expect(result.class).to eq(Float)
    end
  end

  describe "#near_me" do
    it "should get distance between two zipcodes", :vcr do
      result = ZipcodeFacade.near_me(@profile_1.zipcode)
      expected = ["80123", "80235", "80128", "80127", "80227", "80236", "80160", "80161", "80165", "80166", "80465", "80110", "80232", "80120", "80225", "80150", "80151", "80155", "80228", "80219"]
      expect(result.class).to eq(Array)
      expect(result).to eq(expected)
    end
  end
end
