class GuestsController < ApplicationController
  before_filter :set_event
  before_filter :set_guest, only: [:show, :update, :edit, :destroy]

  def update
    @guest.update_attributes(guest_params)
    EventNotification.find_or_create_by({notification_type: "rsvp", event_id: @guest.event.id, guest_id: @guest.id})
    Event.delay(queue: "notification", run_at: notification_delay).send_notifications(@guest.event.id)
    if @guest.rsvp? || @guest.partner_rsvp?
      redirect_to event_path(@event, :anchor => "location"), :flash => { :notice => "Thank you for letting us know, we look forward to seeing you!" }
    else
      redirect_to rsvp_event_guest_path(@event, @guest), :flash => { :notice => "Thank you for letting us know, we're sorry you can't make it." }
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
