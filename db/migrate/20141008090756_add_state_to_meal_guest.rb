class AddStateToMealGuest < ActiveRecord::Migration
  def change
    add_column :meal_guests, :state, :integer, limit: 1, default: 0
  end
end
