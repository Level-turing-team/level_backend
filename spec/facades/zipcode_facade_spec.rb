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
end
