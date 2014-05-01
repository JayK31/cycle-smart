class GrouponController < ApplicatonController

  def index
    @bike_deals = Groupon.fetch

    respond_to do |format|
      format.html {}
      format.json { render json: @bike_deals }
    end
  end

end