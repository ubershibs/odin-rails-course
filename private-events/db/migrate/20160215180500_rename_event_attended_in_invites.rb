class RenameEventAttendedInInvites < ActiveRecord::Migration
  def change
    change_table :invites do |t|
      t.rename :event_attended_id, :attendded_event_id
    end
  end
end
