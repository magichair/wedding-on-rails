class GuestsController < ApplicationController
  before_filter :set_event
  before_filter :set_guest, only: [:show, :update, :edit, :destroy]

  def update
    @guest.update_attributes(guest_params)
    EventMailer.notifications(@guest).deliver
    if @guest.rsvp? || @guest.partner_rsvp?
      redirect_to event_path(@event, :anchor => "location"), :flash => { :notice => "Thanks for letting us know, we look forward to seeing you!" }
    else
      redirect_to rsvp_event_guest_path(@event, @guest), :flash => { :notice => "Thanks for letting us know, we're sorry you can't make it" }
    end
  end

  def rsvp
    @event = Event.find(params[:event_id])
    @guest = Guest.find(params[:id])
  end

  private

    def guest_params
      params.require(:guest).permit(:name, :rsvp, :vegetarian, :partner_rsvp, :allergies, :kids_menu_choices, :music)
    end

    def set_event
      @event = Event.find params[:event_id] || default_event
    end

    def set_guest
      guest_id = params[:guest_id] || params[:id]
      @guest = @event.guests.find guest_id
    end

end
