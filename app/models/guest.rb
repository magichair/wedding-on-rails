class Guest < ActiveRecord::Base
  belongs_to :event

  validates_presence_of :event

  has_many :event_notifications

  after_initialize :init

  def init
    self.name ||= "Guest"
    self.vegetarian ||= false
  end

  def is_guest?
    self.name == "Guest"
  end

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
