class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      login user
      redirect_to root_path
    else
      alerts = ["This Email/Password did not match"]
      redirect_to new_session_path, :alert => alerts
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end