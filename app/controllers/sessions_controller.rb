class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render '/sessions/new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end