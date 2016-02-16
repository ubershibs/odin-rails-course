class RenameTableEventAttendeesToInvites < ActiveRecord::Migration
  def change
    rename_table :event_attendees , :invites
  end
end
