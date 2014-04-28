class TrafficIncident < ActiveRecord::Base

  def self.fetch
    responses = HTTParty.get('http://nypd.openscrape.com/data/collisions.json.gz')
    responses.map do |response|
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