class TrafficIncident < ActiveRecord::Base

  def self.fetch
    # fetch data from NYC openscrape
    responses = HTTParty.get('http://nypd.openscrape.com/data/collisions.json.gz')
    # limit the reponses to approx 700
    limit_resp = responses[37000..-1]
    # responses.map do |response|
    limit_resp.map do |response|
      traffic_incident = self.new(latitude: response[0], longitude: response[1])
      if has_bike?(response)
        traffic_incident.save 
      end
    end
  end 

  def self.has_bike?(response)
    response[4..-1].flatten.include? 'bicycle'
  end
end