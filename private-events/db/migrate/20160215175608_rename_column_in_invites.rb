class RenameColumnInInvites < ActiveRecord::Migration
  def change
    change_table :invites do |t|
      t.rename :event_id, :event_attended_id
    end
  end
end
