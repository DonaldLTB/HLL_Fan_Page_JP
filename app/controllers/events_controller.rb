class EventsController < ApplicationController
  before_action :find_user, only: [ :new, :create ]
  def index
    @events = policy_scope(Event)
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = @user
    authorize @event
    if @event.save
      # sleep(1.5)
      # raise
      # sent_event_discord(@event.name, @event.description, @event.day, @event.start_time, @event.end_time, @team)
      redirect_to events_path
    else
      redirect_to events_path, notice: "Please try again"
    end
  end

  private
  
  def find_user
    @user = User.find(params[:user_id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :day, :start_time, :end_time)
  end
end

