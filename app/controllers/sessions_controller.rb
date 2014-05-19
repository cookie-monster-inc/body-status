class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      alerts = ["This Email/Password did not match"]
      redirect_to new_session_path, :alert => alerts
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end