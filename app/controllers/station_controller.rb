class StationController < ApplicationController

  # need station controller so that we can send ajax request to hit /station, and be able to pull station data
  def index
    @stations = Station.fetch
  end

end