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

  def update
    @user = User.find(params[:id]).try(:authenticate, params[:user][:password])
    if @user
      if @user.update_attributes(params[:user])
        redirect_to root_path
      else
        @alerts = @user.errors.full_messages
        render "user/edit"
      end
    else
      @alerts = "The password you entered is not valid"
      render "users/edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end
end