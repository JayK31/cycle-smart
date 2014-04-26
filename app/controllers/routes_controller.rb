class RoutesController < ApplicationController

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @route = Route.new
  end

  def create
    @route = Route.new
    @route.start_point = params[:route][:start_point]
    @route.end_point = params[:route][:end_point]
    @route.description = params[:route][:description]
    @route.user_id = params[:user_id]

    if @route.save
      flash[:message] = "Route added!"
      redirect_to root_path
    else
      flash[:message] = "Something went wrong! Please try again."
      render(:new)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @route = Route.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @route = Route.find(params[:id])
  end



end
