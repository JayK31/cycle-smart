class UsersController < ApplicationController

  # users/new --> to new user form
  def new
    @user = User.new
  end

  # POST to users/new 
  def create
    @user = User.new(
          name: params[:user][:name],
          email: params[:user][:email],
          password: params[:user][:password],
          password_confirmation: params[:user][:password_confirmation]
          )
      # redirect to user page and flash notice if  user saved successfully
      if @user.save        
        flash[:created] = "Account successfully created!"
        redirect_to root_path
      # flash error, render new form is something went wrong
      else
        flash[:create_error] = "Something went wrong!"
        render :new
      end
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
