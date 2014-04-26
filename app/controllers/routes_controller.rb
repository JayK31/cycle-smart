class RoutesController < ApplicationController

  def index
  end

  def new
    @route = Route.new
  end

end
