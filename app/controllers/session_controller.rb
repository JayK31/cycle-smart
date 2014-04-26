class SessionController < ApplicationController

  # Where user's go to login, redirect to login form which is the view file of the new action
  def new
  end

  def create
    # find the user by the given email from the form
    user = User.find_by(email: params[:email])
    # if we found the user and they gave us the right password
    if user && user.authenticate(params[:password])
      # store user id in session
      # the key to the flash hash can be anything, you can call it user_name, football, etc.
      session[:user_id] = user.id
      redirect_to("/")
    else
      # rerender the login form
      render(:new)
    end
  end

  def destroy
    # we can set the session user_id to nil
    session[:user_id] = nil
    flash[:notice] = "Logged Out!"
    redirect_to(root_path)
  end

end
