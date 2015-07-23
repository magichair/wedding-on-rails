class ChangeKidsCountToBoolean < ActiveRecord::Migration
  def change
    remove_column :guests, :kids
    add_column :guests, :has_kids, :boolean, :default => false
  end
end
