class UsersController < ApplicationController
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to root_path
    else
      @alerts = @user.errors.full_messages
      redirect_to new_user_path, :alert => @user.errors.full_messages
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
        redirect_to edit_user_path, :alert => @user.errors.full_messages
      end
    else
      redirect_to edit_user_path, :alert => ["The password you entered is not valid"]
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end
end