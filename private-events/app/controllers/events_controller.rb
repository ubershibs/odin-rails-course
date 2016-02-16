class EventsController < ApplicationController
  def index
    @upcoming_events = Event.all.upcoming
    @past_events = Event.all.past 
  end

  def new
    @event = current_user.hosted_events.new
  end

  def create
    @event = current_user.hosted_events.new(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :location, :date)
    end
end
