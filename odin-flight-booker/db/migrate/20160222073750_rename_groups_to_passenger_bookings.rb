class RenameGroupsToPassengerBookings < ActiveRecord::Migration
  def change
    rename_table :groups, :passenger_bookings
  end
end
