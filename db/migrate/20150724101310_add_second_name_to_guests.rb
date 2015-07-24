class AddSecondNameToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :partner_name, :string
  end
end
