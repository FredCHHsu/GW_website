class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fblink, :string
  end
end
