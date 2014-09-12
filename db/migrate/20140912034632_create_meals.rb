class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :title
      t.string :type
      t.text :menu
      t.integer :minGuests
      t.integer :maxGuests
      t.datetime :startTime
      t.datetime :endTime
      t.timestamps
    end
  end
end
