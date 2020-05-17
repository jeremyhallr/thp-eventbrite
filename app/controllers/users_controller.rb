class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit]

  def show
    @events = Event.where(admin: current_user)
    @user = User.find(params[:id])
    @email = @user.email
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if current_user == @user
      @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], description: params[:description])
      flash[:success] = "User info successfully updated"
      redirect_to user_path
    else
      flash[:failure] = "User info update failed"
      render :edit
    end
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

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
