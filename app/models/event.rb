class Event < ActiveRecord::Base
  has_many :guests
  has_many :event_notifications

  def days_to_go
    (Event.last.date - Date.today).to_int.clamp(0, Float::INFINITY)
  end

  def formatted_time
    date.strftime("#{date.day.ordinalize} %B %Y")
  end

  def in_past?
    date < Date.today
  end

  def is_today?
    date == Date.today
  end

  def self.send_notifications(id)
    find(id).send_notifications
  end

  def send_notifications
    rsvps = Event.first.event_notifications.where(notification_type: "rsvp")
    unless rsvps.empty?
      if EventMailer.notifications(rsvps).deliver
        rsvps.destroy_all
      end
    end
  end
end
