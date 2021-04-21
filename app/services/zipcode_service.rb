class ZipcodeService

  def self.get_data(zipcode1, zipcode2)
    response = conn.get("/api/v1/distance/#{zipcode1}/#{zipcode2}")
    JSON.parse(response.body)
  end

  def self.get_zipcodes(zipcode, radius)
    radius_int = radius.to_i
    response = conn.get("/api/v1/radius/#{zipcode}/#{radius_int}")
    JSON.parse(response.body)
  end

  def self.conn
    @conn ||= Faraday.new(url: 'https://obscure-eyrie-43294.herokuapp.com')
  end

end
