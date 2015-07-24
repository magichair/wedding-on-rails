class EventsController < ApplicationController

  before_filter :set_event, only: [:show, :update, :search]

  def show
    @guests = @event.guests
  end

  def update
    @event.update_attributes(event_params)
    redirect_to :back
  end

  def search
    names = params[:search][:query].downcase.split(" ")
    if names.count > 0
      @guest = Guest.where("lower(name) IN (?) AND (lower(partner_name) IN (?) OR partner_name = ? OR partner_name = '')",names,names,nil)
    end
    if @guest.any?
      redirect_to rsvp_event_guest_path(@event,@guest.last)
    else
      redirect_to event_path(@event, :anchor => "rsvp"), :flash => { :error => "Can not find your invite, please try again only including first names, or email Helen with your reply." }
    end
  end

  private

  def set_event
    @event = Event.find params[:id] || default_event
  end

  def event_params
    params.require(:event).permit(:date, :location, :active, :title, :primary_venue_photo)
  end

end
