class AddColumnsToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :payment, :boolean, default: false
    add_column :reservations, :amount, :integer, default: 1
    add_column :reservations, :totalprice, :integer
    add_column :reservations, :contact_name, :string
    add_column :reservations, :contact_mail, :string
    add_column :reservations, :contact_phone, :integer

  end
end
