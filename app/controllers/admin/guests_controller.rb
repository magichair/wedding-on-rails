class Admin::GuestsController < ApplicationController
  layout "admin"
  before_filter :set_event
  before_filter :set_guest, only: [:show, :update, :edit, :destroy]

  def index
    render json: @guests
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.event = @event
    @guest.save!
    redirect_to admin_root_path
  end

  def edit
  end

  def update
    @guest.update_attributes(guest_params)
    render :nothing => true, :status => 200
  end

  def rsvp
    render "rsvp", layout: false if params[:raw]
  end

  def destroy
    @guest.destroy
    redirect_to :back
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
