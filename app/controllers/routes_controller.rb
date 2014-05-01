class RoutesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @routes = Route.where(user_id: params[:user_id])

    respond_to do |format|
      format.html {}
      format.json { render json: @routes }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @route = Route.new
  end

  def create
    @user = User.find(params[:user_id])
    @route = Route.new
    @route.start_point = params[:route][:start_point]
    @route.end_point = params[:route][:end_point]
    @route.description = params[:route][:description]
    @route.user_id = params[:user_id]

    if @route.save
      flash[:message] = "Route added!"
      redirect_to user_path(@user)
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

  def update
    @user = User.find(params[:user_id])
    @route = Route.find(params[:id])

    @route.update(
      start_point: params[:route][:start_point],
      end_point: params[:route][:end_point],
      description: params[:route][:description]
      )

    redirect_to user_route_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @route = Route.find(params[:id])

    @route.destroy

    redirect_to user_routes_path
  end


end
