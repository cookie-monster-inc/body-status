class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  private
  
  def login user
    session[:user_id] = user.id
  end

  def logout
    reset_session
    @current_user = nil
  end

end
