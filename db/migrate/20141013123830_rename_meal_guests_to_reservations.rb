class RenameMealGuestsToReservations < ActiveRecord::Migration
  def self.up
    rename_table :meal_guests, :reservations
  end
  def self.down
    rename_table :reservations, :meal_guests
  end
end
