class AttendancesController < ApplicationController
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
  end
end
