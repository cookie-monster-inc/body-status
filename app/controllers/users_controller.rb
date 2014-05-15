class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new params[:user]
    if user.save
      redirect_to new_user_path
    else
      render "users/new"
    end
  end
end