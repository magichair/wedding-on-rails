class Guest < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :event
  has_many :event_notifications

  default_scope { order("invited_to_ceremony = true DESC, id ASC") }

  def self.attending
    where({rsvp: true})
  end

  def self.not_attending
    where({rsvp: false})
  end

  def self.attendance_unknown
    where({rsvp: nil})
  end

end
