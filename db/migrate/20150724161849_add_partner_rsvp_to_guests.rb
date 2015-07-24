class AddPartnerRsvpToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :partner_rsvp, :boolean, :default => false
  end
end
