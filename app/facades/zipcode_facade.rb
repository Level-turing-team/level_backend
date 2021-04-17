class ZipcodeFacade

  def self.distance_between(zipcode1, zipcode2)
    ZipcodeService.get_data(zipcode1, zipcode2)['distance'][zipcode2]
  end

  def self.near_me(zipcode, radius = 10)
    ZipcodeService.get_zipcodes(zipcode, radius)['valid_codes'].map do |zip|
      zip['code']
    end
  end

  def self.get_zipcodes(zipcode, radius)
    data = ZipcodeService.get_zipcodes(zipcode, radius)['valid_codes']
    data.map do |object|
      object['code'] if object['code']
    end
  end
end
