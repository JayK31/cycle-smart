class TrafficIncidentsController < ApplicationController

  def index
    @traffic_incidents = TrafficIncident.all

    respond_to do |format|
      format.html {}
      format.json { render json: @traffic_incidents }
    end
  end

end

