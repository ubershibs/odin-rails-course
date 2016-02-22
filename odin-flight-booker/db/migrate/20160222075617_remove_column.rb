class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :bookings, :group_id
  end
end
