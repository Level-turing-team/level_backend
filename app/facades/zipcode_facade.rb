class ZipcodeFacade

  def self.distance_between(zipcode1, zipcode2)
    Rails.cache.fetch([zipcode1, zipcode2],
    expires_in: 1.week) do
      ZipcodeService.get_data(zipcode1, zipcode2)['distance'][zipcode2]
    end
  end

  def self.near_me(zipcode, radius = 10)
    Rails.cache.fetch([zipcode, radius],
    expires_in: 1.week) do
      ZipcodeService.get_zipcodes(zipcode, radius)['valid_codes'].map do |zip|
        zip['code']
      end
    end
  end

  def self.get_zipcodes(zipcode, radius)
    Rails.cache.fetch([zipcode, radius],
    expires_in: 1.week) do
      return [] if ZipcodeService.get_zipcodes(zipcode, radius)['body']
      data = ZipcodeService.get_zipcodes(zipcode, radius)['valid_codes']
      data.map do |object|
        object['code'] if object['code']
      end
    end
  end
end
