class Shop

  def self.fetch
    # send request to google looking for bike ships in NYC with a radius of 5 miles and our own app API key
    raw_shops = HTTParty.get('https://maps.googleapis.com/maps/api/place/textsearch/json?query=bike+shops+in+New+York+City&radius=5&key=AIzaSyBIulR_wri0cF9_VjnGiZB5RAPqiVMX9-8&sensor=false')
    # binding.pry
    shops = raw_shops["results"]
  end

end