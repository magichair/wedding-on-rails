class EventMailer < ApplicationMailer
  def notifications(rsvps, photos)
    @rsvps = rsvps
    mail to: "darthhelen@googlemail.com, andrewsprinz@gmail.com", subject: "RSVP from Brains and Packhorse"
  end
end
