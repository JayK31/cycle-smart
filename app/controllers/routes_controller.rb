class RoutesController < ApplicationController

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @route = Route.new
  end

  def create
    @route = Route.new
    @route.start_point = params[:routes][:start_point]
    @route.end_point = params[:routes][:end_point]
    @route.description = params[:routes][:description]
    @route.user_id = session[:user_id]

    if @route.save
      redirect_to root
    else
      flash[:message] = "Something went wrong! Please try again."
      render(:new)
    end
  end

end
