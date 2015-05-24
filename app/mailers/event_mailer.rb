class EventMailer < ApplicationMailer
  def notifications(rsvps, photos)
    @rsvps = rsvps
    @photos = photos
    mail to: "us@brainsandpackhorse.co.uk", subject: "Notification from brainsandpackhorse.co.uk"
  end
end
