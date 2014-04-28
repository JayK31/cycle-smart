class TrafficIncidents < ActiveRecord::Base

  @@bike_accidents = []

  def self.bike_accidents
    @@bike_accidents
  end

  def self.load
    responses = HTTParty.get('http://nypd.openscrape.com/data/collisions.json.gz')
    # parsed_responses = JSON.parse(responses)
    responses.each do |incident|
      individual_incident = self.new(incident)
      self.new(latitude: self.latitude, longitude: self.longitude )
      if individual_incident.has_bike?
        individual_incident.save
      end 
      # if self.new(incident).has_bike?
      #   @@bike_accidents << self 
      # end
    end
  end

  def initialize(response)
    @response = response
  end

  def has_bike?
    @response[4..-1].flatten.include? 'bicycle'
  end

  def latitude
    @response[0].to_f
  end

  def longitude
    @response[1].to_f
  end


end

  # def bicycle_accident
  #   incidents = self.load
  #   incidents.each do |incident|
  #     @@bike_accidents << self if has_bike? 
  #   end
  # end

# traffic_incidents.select --> use has_bike