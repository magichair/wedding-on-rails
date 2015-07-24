class Admin::AdminController < ApplicationController
  layout "admin"
  before_filter :authenticate

  def dashboard
    @event = Event.first
    @guests = GuestDecorator.all
    @music_suggestions = Guest.where("music IS NOT NULL and music != ''")
  end

  private

  def authenticate
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
      end
    end
  end
end
