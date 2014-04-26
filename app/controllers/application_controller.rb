class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  # declare a method as a helper
  # http://api.rubyonrails.org/classes/AbstractController/Helpers/ClassMethods.html#method-i-helper_method
  # which means we can use the methods in the view as well
  helper_method(:current_user, :logged_in?)

end
