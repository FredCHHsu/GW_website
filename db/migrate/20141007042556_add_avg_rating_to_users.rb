class AddAvgRatingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avgRating, :float, default: 0.0
    add_column :users, :commentCount, :integer, default: 0
  end
end
