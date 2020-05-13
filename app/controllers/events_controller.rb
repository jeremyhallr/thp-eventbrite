class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]

  def new
  end

  def create
    @event = Event.new(title: params[:title], location: params[:location], price: params[:price], description: params[:description], start_date: params[:start_date], duration: params[:duration], admin: current_user)

    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to root_path
    else
      flash[:failure] = "Invalid input"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
    unless current_user == @event.admin
      flash[:failure] = "Not authorized"
      redirect_to root_path
    end
  end

  def update
    @event = Event.find(params[:id])

    if current_user == @event.admin
      @event.update(title: params[:title], location: params[:location], price: params[:price], description: params[:description], start_date: params[:start_date], duration: params[:duration])
      flash[:success] = "Event successfully updated"
      redirect_to event_path
    else
      flash[:failure] = "Event update failed"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user == @event.admin
      @event.destroy
      flash[:success] = "Event successfully removed"
      redirect_to root_path
    else
      flash[:failure] = "Event removal failed"
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
