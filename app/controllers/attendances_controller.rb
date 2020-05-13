class AttendancesController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def new
    @event = Event.find(params[:id])
  end

  def create
    @attendance = Attendance.new(user_id: params[:user_id], event_id: params[:event_id], stripe_customer_id: params[:customer_id])

    if @attendance.save
      flash[:success] = "Event registration successfully saved"
      redirect_to root_path
    else
      flash[:failure] = "Event registration saving failed"
      redirect_to root_path
    end
  end

  def index
    @event = Event.find(params[:id])
    @attendances = @event.attendances
    unless current_user == @event.admin
      flash[:failure] = "Not authorized"
      redirect_to root_path
    end
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end
end
