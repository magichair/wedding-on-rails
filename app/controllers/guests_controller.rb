class GuestsController < ApplicationController
  before_filter :set_event
  before_filter :set_guest, only: [:show, :update, :edit, :destroy]

  def update
    @guest.update_attributes(guest_params)
    EventNotification.find_or_create_by({notification_type: "rsvp", event_id: @guest.event.id, guest_id: @guest.id})
    Event.delay(queue: "notification", run_at: notification_delay).send_notifications(@guest.event.id)
    render :nothing => true, :status => 200
  end

  def rsvp

  end

  def search

  end

  private

    def guest_params
      params.require(:guest).permit(:name, :rsvp, :invited_to_ceremony, :invited_to_evening, :vegetarian)
    end

    def set_event
      @event = Event.find params[:event_id] || default_event
    end

    def set_guest
      guest_id = params[:guest_id] || params[:id]
      @guest = @event.guests.find guest_id
    end

end
