class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    # find the user we want to edit by id
    # this will send the @user to the edit page with a form
    @user = User.find(params[:id])
  end

  def update
  end

  def delete
  end


end
