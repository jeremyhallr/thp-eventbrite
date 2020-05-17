class Admin::BaseController < ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
    unless current_user && current_user.email == "adminou@yopmail.com"
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

end
