class AddHostToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :host, index: true, foreign_key: true
  end
end
