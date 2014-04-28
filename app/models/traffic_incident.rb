class TrafficIncident

  def self.load
    responses = HTTParty.get('http://nypd.openscrape.com/data/collisions.json.gz')
    # parsed_responses = JSON.parse(responses)
    responses.map do |incident|
      self.new(incident)
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

  
  # def longitude
  # end

  # def accidents
  #   # from [4..-1]
  # end

end


# traffic_incidents.select --> use has_bike