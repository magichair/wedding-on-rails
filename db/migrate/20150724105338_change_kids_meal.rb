class ChangeKidsMeal < ActiveRecord::Migration
  def change
    remove_column :guests, :kids_menu_choice
    add_column :guests, :kids_menu_choices, :string
  end
end
