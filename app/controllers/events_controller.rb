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
      names = names.map{ |name| name.strip }.join('|')
      @guest = Guest.where("lower(name) LIKE ? AND (lower(partner_name) LIKE ? OR (partner_name IS NULL OR partner_name = ''))","(#{names})%","%(#{names})%").order(:partner_name)
      if @guest.any?
        redirect_to rsvp_event_guest_path(@event,@guest.first) and return
      end
    end

    redirect_to event_path(@event, :anchor => "rsvp"), :flash => { :error => "We could not find your invite, try again ensuring you enter your name as it appears on your invite, or email Helen with your reply" }

  end

  private

  def set_event
    @event = Event.find params[:id] || default_event
  end

  def event_params
    params.require(:event).permit(:date, :location, :active, :title, :primary_venue_photo)
  end

end
