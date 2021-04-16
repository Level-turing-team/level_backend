class ZipcodeService

  def self.get_data(zipcode1, zipcode2)
    response = conn.get("/distance/#{zipcode1}/#{zipcode2}")
    JSON.parse(response.body)
  end

  def self.get_zipcodes(zipcode, radius)
    response = conn.get("/radius/#{zipcode}/#{radius}")
    JSON.parse(response.body)
  end

  def self.conn
    @conn ||= Faraday.new(url: 'https://obscure-eyrie-43294.herokuapp.com')
  end

end
