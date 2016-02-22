class DropColumnGroupIdFromBookings < ActiveRecord::Migration
  def change
    remove_index :bookings, :group_id
  end
end
