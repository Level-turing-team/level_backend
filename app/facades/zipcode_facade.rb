class ZipcodeFacade

  def self.distance_between(zipcode1, zipcode2)
    ZipcodeService.get_data(zipcode1, zipcode2)['distance'][zipcode2]
  end

end
