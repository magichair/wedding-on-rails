class EventMailer < ApplicationMailer
  def notifications(rsvp)
    @rsvp = rsvp
    mail to: "darthhelen@googlemail.com, andrewsprinz@gmail.com", subject: "RSVP from Brains and Packhorse"
  end
end
