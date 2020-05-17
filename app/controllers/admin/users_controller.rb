class Admin::UsersController < ApplicationController

  def new
  end

  def create
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      flash[:success] = "Profile deleted"
      redirect_to root_path
    else
      flash[:failure] = "Profile delete failed"
      render :edit
    end
  end
end
