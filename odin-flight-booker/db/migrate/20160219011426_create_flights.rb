class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :from_airport, index: true, foreign_key: true
      t.references :to_airport, index: true, foreign_key: true
      t.datetime :start_time
      t.integer :duration

      t.timestamps null: false
    end
  end
end
