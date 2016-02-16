class RenameColumnInvitesAttendedEventId < ActiveRecord::Migration
  def change
     change_table :invites do |t|
      t.rename :attendded_event_id, :attended_event_id 
    end
  end
end
