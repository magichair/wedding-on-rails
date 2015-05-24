def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

event = Event.create!({
  date: Date.parse("2015-09-27"),
  location: "Ghillie Dhu, Edinburgh",
  active: true,
  title: "Brains and Packhorse",
  partner_one: "Helen",
  partner_two: "Kyle",
  venue_name: "Ghillie Dhu",
  venue_address_line_one: "2 Rutland Square",
  venue_address_city: "Edinburgh",
  venue_address_state: "Scotland",
  venue_address_zip: "EH1 2AD",
  venue_address_country: "United Kingdom",
  venue_body: """
Both the ceremony and reception will be held at the Ghillie Dhu
  """,
  venue_directions: """
Follow the yellow brick road
  """
})

venue_photos = VenuePhoto.create!([
  { event_id: event.id, file: seed_image("venue_photos/1.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/2.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/3.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/4.jpg") }
])

event.primary_venue_photo = venue_photos.last.id
event.save!

senters = Group.create!({
  event_id: event.id
})

fords = Group.create!({
  event_id: event.id
})

angela = Guest.create!({
  name: "Angela Flett",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: senters.id,
  event_id: event.id
})

debug = Group.create!({
  event_id: event.id
})

no_rsvp = Guest.create!({
  name: "no_rsvp",
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: debug.id,
  event_id: event.id
})

rsvp_false = Guest.create!({
  name: "rsvp_false",
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: false
})

rsvp_true = Guest.create!({
  name: "rsvp_true",
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: true
})

guest_no_rsvp = Guest.create!({
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: debug.id,
  event_id: event.id
})

guest_rsvp_false = Guest.create!({
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: false
})

guest_rsvp_true = Guest.create!({
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id,
  group_id: debug.id,
  rsvp: true
})




