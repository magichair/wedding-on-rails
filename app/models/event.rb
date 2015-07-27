class Event < ActiveRecord::Base
  has_many :guests

  def days_to_go
    (Event.last.date - Date.today).to_int.clamp(0, Float::INFINITY)
  end

  def formatted_time
    date.strftime("%d %B %Y")
  end

  def in_past?
    date < Date.today
  end

  def is_today?
    date == Date.today
  end

end
