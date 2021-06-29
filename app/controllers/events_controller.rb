class EventsController < ApplicationController
  before_action :find_user, only: [ :new, :create ]
  def index
    @events = policy_scope(Event)
    @event_image = Event::EVENT_IMAGE["Team vs. Team イベント"]
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
      sent_event_discord(@event.name, @event.description, @event.day, @event.start_time, @event.end_time)
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

  WEBHOOK_URL = ENV["DISCORD"]
  
  def sent_event_discord(event_name, description, day, start_time, end_time)
    require 'discordrb/webhooks'

    client = Discordrb::Webhooks::Client.new(url: ENV["DISCORD"])
    client.execute do |builder|
      builder.content = "@everyone NEW Event!"
      builder.add_embed do |embed|
        embed.title = event_name
        embed.color = 16_056_575
        embed.url = "https://hll4jp.herokuapp.com/events"
        # change LINK to clanparty.net later!!!
        embed.description = "#{description}!"
        embed.add_field(name: 'Day', value: day, inline: true)
        embed.add_field(name: 'Time', value: "#{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M')}", inline: true)
        embed.image = Discordrb::Webhooks::EmbedImage.new(url: Event::EVENT_IMAGE[event_name])
        embed.timestamp = Time.now
      end
    end
  end
end

