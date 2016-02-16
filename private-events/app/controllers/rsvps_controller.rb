class RsvpsController < ApplicationController
  def create
    @event = Event.find(params[:rsvp][:attended_event_id])
    current_user.attend!(@event)
    flash[:success] = "#{current_user.name} has RSVPed for this event"
    redirect_to @event
  end

  def destroy
    @event = Rsvp.find(params[:id]).attended_event
    current_user.cancel!(@event)
    flash[:warning] = "#{current_user.name} is no longer RSVPed for this event"
    redirect_to @event
  end
end
