class Groupon

  def self.fetch
    raw_bike_deals = HTTParty.get('https://partner-api.groupon.com/deals.json?tsToken=US_AFF_0_201236_212556_0&division_id=new-york&query=bike&locale=en_US')
    bike_deals = raw_bike_deals["deals"]
  end
end