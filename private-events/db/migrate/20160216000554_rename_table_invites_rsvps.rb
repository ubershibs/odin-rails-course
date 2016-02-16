class RenameTableInvitesRsvps < ActiveRecord::Migration
  def change
    rename_table :invites, :rsvps
  end
end
