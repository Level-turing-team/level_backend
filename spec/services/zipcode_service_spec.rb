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

  describe "#get_zipcodes" do
    it "should return json for all profile near me", :vcr do
      result = ZipcodeService.get_zipcodes(@profile_1.zipcode, 10)
      expect(result.class).to eq(Hash)
      expect(result).to have_key('original_code')
      expect(result).to have_key('valid_codes')
      expect(result['valid_codes'].class).to eq(Array)
      expect(result['valid_codes'][0]).to have_key('city')
      expect(result['valid_codes'][0]).to have_key('state')
      expect(result['valid_codes'][0]).to have_key('distance')
    end
  end

end
