class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to new_user_path
    else
      @alerts = @user.errors.full_messages
      render "users/new"
    end
  end

  def edit
  end
end