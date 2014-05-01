class ShopController < ApplicationController

  def index
    @shops = Shop.fetch

    respond_to do |format|
      format.html {}
      format.json { render json: @shops }
    end
  end

end

