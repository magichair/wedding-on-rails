class GuestDecorator < Draper::Decorator
  delegate_all

  def rsvp
    return "Unknown" if model.rsvp.nil?
    return model.rsvp ? h.content_tag(:span, "Yes", class: "text--success") : h.content_tag(:span, "No", class: "text--error")
  end

end
