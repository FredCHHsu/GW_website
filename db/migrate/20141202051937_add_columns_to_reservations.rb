class AddColumnsToReservations < ActiveRecord::Migration
  def change
    add_column :Reservations, :payment, :boolean, default: false
    add_column :Reservations, :amount, :integer, default: 1
    add_column :Reservations, :totalprice, :integer
    add_column :Reservations, :contact_name, :string
    add_column :Reservations, :contact_mail, :string
    add_column :Reservations, :contact_phone, :integer

  end
end
