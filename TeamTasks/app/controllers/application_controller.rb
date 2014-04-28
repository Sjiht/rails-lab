class ApplicationController < ActionController::Base
  protected
  
  def current_user
    # get current user details
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    # check if the user is signed in
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    # if the user is signed in
    # create the session for the user
    @current_user = user
    session[:user_id] = user.id
  end
  
end
