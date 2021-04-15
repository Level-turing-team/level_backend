require 'rails_helper'

RSpec.describe ZipcodeService, type: :model do

  before :each do
    @profile_1 = create(:profile, zipcode: '80123')
    @profile_2 = create(:profile, zipcode: '80125')
  end

  describe "#get_data" do
    it "should return json for distance between two zip codes", :vcr do
      result = ZipcodeService.get_data(@profile_1.zipcode, @profile_2.zipcode)

      expect(result.class).to eq(Hash)
      expect(result).to have_key('original_code')
      expect(result).to have_key('distance')
      expect(result['distance']).to have_key(@profile_2.zipcode)
    end
  end

end
