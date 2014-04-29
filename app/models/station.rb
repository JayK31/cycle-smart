class Station

  # class method fetch to pull down citi data
  def self.fetch
    raw_stations = HTTParty.get('http://citibikenyc.com/stations/json')
    stations = raw_stations["stationBeanList"]
  end

end