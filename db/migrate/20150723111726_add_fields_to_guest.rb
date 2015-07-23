class AddFieldsToGuest < ActiveRecord::Migration
  def change
    change_column :guests, :invited_to_ceremony, :boolean, :default => false
    change_column :guests, :invited_to_evening, :boolean, :default => false
    change_column :guests, :vegetarian, :boolean, :default => false
    remove_column :guests, :arrival_transportation_required
    remove_column :guests, :departing_transport_requred
    add_column :guests, :allergies, :string
    add_column :guests, :kids, :integer
    add_column :guests, :kids_menu_choice, :integer, :default => 0
    add_column :guests, :music, :string
  end
end
