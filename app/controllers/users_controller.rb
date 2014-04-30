class UsersController < ApplicationController

  # users/new --> to new user form
  def new
    @user = User.new
  end

  # POST to users/new
  def create
      #strong params to create new user
      @user = User.new(user_params)

      # redirect to user page and flash notice if  user saved successfully
      if @user.save
        #store session once creation
        session[:user_id] = @user.id
        flash[:created] = "Account successfully created!"
        #redirect to new user page (syntatic sugar)
        redirect_to @user
      # flash error, render new form is something went wrong
      else
        flash[:create_error] = "Something went wrong!"
        render :new
      end
  end

  # get /users/:id
  def show
    @user = User.find(params[:id])
    @routes = Route.all
  end

  #get /users/:id/edit --> send to form
  #form will route to users#update
  def edit
    # find the user we want to edit by id
    # this will send the @user to the edit page with a form
    @user = User.find(params[:id])
  end

  #find user by form params, update accordingly
  def update
    @user = User.find(params[:id])

    @user.update(
      name: params[:user][:name],
      email: params[:user][:email]
      )
    # update user then redirect them to their own page
    flash[:update] = "Account successfully updated."
    redirect_to user_path(@user)
  end

  #find user using params from link_to, delete and send to root
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:delete] = "We hate to see you go! Cycle safe!"
    redirect_to root_path
  end

  # use strong params for creating new user
  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation )
  end

end
