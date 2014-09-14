class AddPictureToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :picture, :string
  end
end
